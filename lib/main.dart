import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:toy_project1/Screens/Mainscreen.dart';

void main() async{
  await Hive.initFlutter();

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