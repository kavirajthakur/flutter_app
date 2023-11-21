import 'package:flutter/material.dart';
import 'package:flutter_application_1/chatbox.dart';
import 'package:flutter_application_1/messageModel.dart';

class MessageBox extends StatefulWidget {
  const MessageBox({Key? key});

  @override
  State<MessageBox> createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          color: Colors.white,
          child: ListView(
            children: List.generate(messages.length, (index) {
              return ChatBox(
                
                isMe:messages[index]['isMe'], 
                message: messages[index]['message'],
              
              );
            }),
          ),
        ),
      ),
     
    );
  }
}
