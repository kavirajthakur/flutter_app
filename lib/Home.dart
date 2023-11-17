import 'package:flutter/material.dart';

import 'messagebox.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child:  InkWell(
            onTap: (){},
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
                'Kaviraj Rajput',
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
                    "Active Now",
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
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                size: 20,
              ))
        ],
      ),
      body: MessageBox(),
    );
  }
}
