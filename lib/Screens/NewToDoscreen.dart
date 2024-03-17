import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:toy_project1/Widgets/MemoWidget.dart';
import 'package:toy_project1/Widgets/ToDoWidget.dart';
import '../Widgets/MyDatePicker.dart';
import '../Widgets/MyTimePicker.dart';

class NewToDoScreen extends StatefulWidget {
  const NewToDoScreen({super.key});

  @override
  State<NewToDoScreen> createState() => _NewToDoScreenState();
}

class _NewToDoScreenState extends State<NewToDoScreen> {
  save() { //완료 클릭 시 할 일 저장 (구현 필요) - 할 일 공란 시 경고창 생성 추가
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("저장해라잉"),
      );
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      appBar: AppBar(
        backgroundColor: Colors.amber.shade100,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context), //navigator 기본 제공 뒤로 가기 버튼 -> 아이콘 수정 위해 leading 작성
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("취소", style: TextStyle(fontSize: 18),),
            ],
          ),
        ),
        title: const Text("오늘의 할 일이 무엇인가요?", style: TextStyle(fontSize: 22),),
        actions: [
          IconButton(onPressed: () => save(), icon: const Text("완료", style: TextStyle(fontSize: 18),)) //!!!!Save 구현 필요!!!!
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              children: [
                Column(
                  children: [
                    ToDoText(),
                  ],
                ), //할 일

                SizedBox(height: 20,),

                Column(
                  children: [
                    MyDatePicker(),
                  ],
                ), //날짜

                SizedBox(height: 60,),

                Column(
                  children: [
                    MyTimePicker(),
                  ],
                ), //시간

                SizedBox(height: 50,),

                Column(
                  children: [
                    Memo()
                  ],
                ), //메모

                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      )
    );
  }
}
