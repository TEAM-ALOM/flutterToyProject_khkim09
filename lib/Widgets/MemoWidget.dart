import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Memo extends StatefulWidget {
  const Memo({super.key});

  @override
  State<Memo> createState() => _MemoState();
}

class _MemoState extends State<Memo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("메 모", style: TextStyle(fontSize: 20),),
        SizedBox(height: 20,),
        TextField(maxLines: 15, decoration: InputDecoration(border: OutlineInputBorder()),)
      ],
    );
  }
}
