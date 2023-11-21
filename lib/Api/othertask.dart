import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Api/model.dart';
import 'package:http/http.dart' as http;

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  //commit
  List _users = [];
  int page = 1;
  ScrollController scrollController = ScrollController();
  bool _loading = false;
  users? userModel;
  bool statusLoading = false;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        ++page;
        loadUserList();
      }
    });
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
        body: ListView.builder(
                controller: scrollController,
                padding: EdgeInsets.all(20),
                itemCount: _users.length + 1,
                itemBuilder: (context, index) {
                  if (index < _users.length) {
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
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }));
  }

  void loadUserList() async {
    int limit = 8;
    setState(() {
      
      statusLoading = true;
    });
    final url = Uri.parse(
        'https://jsonplaceholder.typicode.com/posts?_limit=$limit&_page = $page');
    final result = await http.get(url);
    if (result.statusCode == 200) {
      var res = jsonDecode(result.body);
      for (var i in res) {
        _users.add(i);
      }
      setState(() {
        statusLoading = false;
      });
    } else {
      print("error ${result.statusCode}");
      setState(() {
        statusLoading = false;
      });
    }
  }
}
