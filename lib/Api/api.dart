import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Api/model.dart';
import 'package:http/http.dart' as http;

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  //commit
  List _users = [];
  bool _loading = false;
  users? userModel;
  bool statusLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('API Calls'),
          centerTitle: true,
        ),
        body: statusLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.brown,
                    margin: EdgeInsets.all(10),
                    child: Column(children: [
                      Column(
                        children: [
                          Text("${_users[index]["userId"]}"),
                          Text(_users[index]["id"].toString()),
                          Text(_users[index]["title"]),
                          Text(_users[index]["body"])
                        ],
                      )
                    ]),
                  );
                }));
  }

  void loadUserList() async {
    setState(() {
      statusLoading = true;
    });
    var res = await http.get(Uri.http('jsonplaceholder.typicode.com', 'posts'));
    if (res.statusCode == 200) {
      var result = jsonDecode(res.body.toString());
      for (var i in result) {
        _users.add(i);
      }
      print(_users[0]);

      setState(() {
        statusLoading = false;
      });
    }
  }
}
