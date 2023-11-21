import 'package:flutter/material.dart';
import 'package:flutter_application_1/chatscreen.dart';
import 'package:flutter_application_1/provider/nameprovider.dart';
import 'package:provider/provider.dart';

class Namechanges extends StatefulWidget {
  const Namechanges({super.key});

  @override
  State<Namechanges> createState() => _NamechangesState();
}

class _NamechangesState extends State<Namechanges> {
  TextEditingController textFieldController = TextEditingController();
  NameProvider? nameChangeProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameChangeProvider = Provider.of(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    nameChangeProvider = context.watch<NameProvider>();
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(40),
            child: TextField(
              controller: textFieldController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Type your name",
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Provider.of<NameProvider>(context, listen: false).setTitle(textFieldController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen('','')),
                );
              },
              child: Text('Done'))
        ],
      ),
    );
  }
}
