import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Theme/theme_provider.dart';
import 'package:flutter_application_1/chatroom.dart';
import 'package:provider/provider.dart';
import 'chatmodel.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final String status;

  ChatScreen(this.name,this.status);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ChatRoom()));
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ),
        title: Row(children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://play-lh.googleusercontent.com/C9CAt9tZr8SSi4zKCxhQc9v4I6AOTqRmnLchsu1wVDQL0gsQ3fmbCVgQmOVM1zPru8UH=w240-h480-rw'),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6), fontSize: 16),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 1),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                   widget.status,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              )
            ],
          )
        ]),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.videocam,
                color: Colors.green,
                size: 20,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.call,
                color: Colors.green,
                size: 20,
              )),
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            icon: Icon(
              Icons.sunny_snowing,
              color: Colors.grey,
            ),
            splashColor: Colors.black,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _databaseHelper.getChatHistory(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  List<Map<String, dynamic>> messages = snapshot.data!;
                  // log(messages.first['message']);
                  // log(messages.first['isSender'].toString() ?? "null");
                  return ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      print(messages[index]['isSender']);
                      // bool isUserMessage = messages[index]['isSender'] ?? 0 == 1 ? true : false;
                      return ListTile(
                        subtitle: Align(
                          alignment: messages[index]['isSender'] == 1
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              //     : Colors.grey, // Change the color as needed
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              messages[index]['message'],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () async {
                    setState(() async {
                      await _sendMessage();
                      _databaseHelper.getChatHistory();
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () async {
                    setState(() async {
                      await _sendMessage(isSender: 1);
                      _databaseHelper.getChatHistory();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _sendMessage({int isSender = 0}) async {
    String sender = 'User'; // Change this to the sender's name
    String message = _messageController.text.trim();

    if (message.isNotEmpty) {
      int result = await _databaseHelper.insertMessage({
        'sender': sender,
        'message': message,
        'isSender': isSender, //bool
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      });
      log(result.toString());

      _messageController.clear();
      setState(() {});
    }
  }
}
