import 'package:flutter/material.dart';
import 'package:flutter_application_1/messageModel.dart';

class ChatBox extends StatefulWidget {
  final String message;
  final bool isMe;

  // Use 'key' instead of 'super.key'
  ChatBox({Key? key, required this.message, required this.isMe}) : super(key: key);

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14),
      child: Row(mainAxisAlignment: widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start, children: [
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              color: widget.isMe ? Colors.greenAccent : Colors.blueAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(13),
              child: Text(
                widget.message,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
