import 'package:flutter/material.dart';
import 'package:flutter_application_1/chatscreen.dart';
import 'package:flutter_application_1/provider/nameprovider.dart';
import 'package:provider/provider.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        actions: [Icon(Icons.keyboard_double_arrow_left_sharp)],
        title: Text(
          'ChatRoom',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            _buildUserTile(
              title: 'Kaviraj Thakur',
              subtitle: 'Online',
              imageUrl:
                  'https://play-lh.googleusercontent.com/C9CAt9tZr8SSi4zKCxhQc9v4I6AOTqRmnLchsu1wVDQL0gsQ3fmbCVgQmOVM1zPru8UH=w240-h480-rw',
            ),
            SizedBox(
              height: 20,
            ),
            _buildUserTile(
              title: 'Mayank Sharma',
              subtitle: 'Offline',
              imageUrl:
                  'https://play-lh.googleusercontent.com/C9CAt9tZr8SSi4zKCxhQc9v4I6AOTqRmnLchsu1wVDQL0gsQ3fmbCVgQmOVM1zPru8UH=w240-h480-rw',
            ),
            SizedBox(
              height: 20,
            ),
            _buildUserTile(
              title: 'Deepak Rana',
              subtitle: 'Offline',
              imageUrl:
                  'https://play-lh.googleusercontent.com/C9CAt9tZr8SSi4zKCxhQc9v4I6AOTqRmnLchsu1wVDQL0gsQ3fmbCVgQmOVM1zPru8UH=w240-h480-rw',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserTile({
    required String title,
    required String subtitle,
    required String imageUrl,
  }) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.green,
          radius: 35,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(imageUrl),
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () {
                  Provider.of<NameProvider>(context, listen: false)
                      .setTitle(title);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatScreen(title, subtitle)));
                },
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                )),
            SizedBox(
              height: 2,
            ),
            Text(subtitle)
          ],
        ),
      ],
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.greenAccent,
      centerTitle: true,
      actions: [Icon(Icons.keyboard_double_arrow_left_sharp)],
      title: Text(
        'ChatRoom',
        style: TextStyle(color: Colors.white),
      ),
    ),
    body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(children: [
        CircleAvatar(
          backgroundColor: Colors.green,
          radius: 35,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                'https://play-lh.googleusercontent.com/C9CAt9tZr8SSi4zKCxhQc9v4I6AOTqRmnLchsu1wVDQL0gsQ3fmbCVgQmOVM1zPru8UH=w240-h480-rw'),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        CircleAvatar(
          backgroundColor: Colors.green,
          radius: 35,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                'https://play-lh.googleusercontent.com/C9CAt9tZr8SSi4zKCxhQc9v4I6AOTqRmnLchsu1wVDQL0gsQ3fmbCVgQmOVM1zPru8UH=w240-h480-rw'),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        CircleAvatar(
          backgroundColor: Colors.green,
          radius: 35,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                'https://play-lh.googleusercontent.com/C9CAt9tZr8SSi4zKCxhQc9v4I6AOTqRmnLchsu1wVDQL0gsQ3fmbCVgQmOVM1zPru8UH=w240-h480-rw'),
          ),
        )
      ]),
    ),
    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Colors.blue,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.call),
          label: 'Calls',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera),
          label: 'Camera',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chats',
        ),
      ],
    ),
  );
}
