import 'package:flutter/material.dart';
import 'package:whatsappnew/homepage.dart';

void main() async {
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        primaryColor: Color(0xFF075E54),
        brightness: Brightness.light,
      ),
      home: MainPage(),
    );
  }
}
