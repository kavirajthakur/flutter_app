import 'package:flutter/material.dart';
import 'package:flutter_application_1/Theme/theme_provider.dart';
import 'package:flutter_application_1/provider/nameprovider.dart';
import 'package:provider/provider.dart';
import 'Api/othertask.dart';
import 'Home.dart';
import 'chatbox.dart';
import 'chatroom.dart';
import 'chatscreen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => NameProvider()),
      ],
   
  
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: ChatRoom(),
      // ChatScreen('', ''),
    );
  }
}
