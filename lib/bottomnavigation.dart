import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chatmodel.dart';

class BottomSendNavigation extends StatefulWidget {
  const BottomSendNavigation({super.key});

  @override
  State<BottomSendNavigation> createState() => _BottomSendNavigationState();
}

class _BottomSendNavigationState extends State<BottomSendNavigation> {
   final TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width / 1.5,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  )),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Type here",
                    icon: Icon(CupertinoIcons.smiley)),
              ),
            ),
            SizedBox(
              width: 2,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.greenAccent),
              child:IconButton(
        icon: Icon(Icons.send),
        onPressed: () {
          
        },
      ),
            )
          ],
        ),
      ),
    );
  }
}
