import 'package:flutter/material.dart';
import 'package:toy_project1/Screens/Mainscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen()
    );
  }
}