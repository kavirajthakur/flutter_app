import 'package:flutter/material.dart';
import 'package:flutter_application_1/chatscreen.dart';

class NameProvider extends ChangeNotifier {
  // late ChatScreen _chatScreen;
  // ChatScreen get chatscreen => _chatScreen;

  String title = '';

  void setTitle(String name) {
    title = name;
    notifyListeners();
  }
}
