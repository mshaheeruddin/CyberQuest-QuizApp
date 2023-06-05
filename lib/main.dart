import 'package:flutter/material.dart';
import 'package:cyberquest_isgame/game_main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cybersecurity Game',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MainScreen(),
    );
  }
}
