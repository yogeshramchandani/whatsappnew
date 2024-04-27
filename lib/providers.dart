import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:whatsappnew/Pages/chat_message.dart';

class chatprovider extends ChangeNotifier {
  final List<ChatMessage> _messages = [];
  final TextEditingController _textEditor = TextEditingController();

  List<ChatMessage> get messages => _messages;
  String title = "WhatsApp";
  int selectedindex = 0;

  String? latestmessage = null;
  String? get _lastmessage => latestmessage;

  String get _title => title;
  int get _selectedindex => selectedindex;

  TextEditingController get textEditor => _textEditor;

  void onItemTapped(int index) {
    selectedindex = index;
    switch (index) {
      case 0:
        title = "WhatsApp";
        break;
      case 1:
        title = "Updates";
        break;
      case 2:
        title = "Communities";
        break;
      case 3:
        title = "Calls";
        break;
      default:
        title = "WhatsApp";
    }
    notifyListeners();
  }

  handleSubmit(String text) {
    _textEditor.clear();
    ChatMessage message = ChatMessage(
      text: text,
      index: 0,
    );
    latestmessage = message.text;
    messages.insert(0, message);
    notifyListeners();
  }
}
