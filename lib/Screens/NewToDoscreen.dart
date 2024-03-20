import 'package:flutter/material.dart';
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
  late String text = "";
  late bool timeCheck = false;

  void updateText(String newText) {
    setState(() {
      text = newText;
    });
  }

  save() async { //완료 클릭 시 할 일 저장 (구현 필요) - 할 일 공란 시 경고창 생성 추가
    Navigator.pop(context, text); //todoData를 pop과 동시에 전달
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
          IconButton(
              onPressed: () => save(), //save 구현 및 mainscreen으로 복귀 구현
              icon: const Text("완료", style: TextStyle(fontSize: 18),)
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              children: [
                Column(
                  children: [
                    ToDoText(onTextSubmitted: updateText), //onTextSubmitted로 받아온 값(newtodo.text)을 updateText에 이용
                  ],
                ), //할 일

                const SizedBox(height: 20,),

                const Column(
                  children: [
                    MyDatePicker(),
                  ],
                ), //날짜

                const SizedBox(height: 60,),

                const Column(
                  children: [
                    MyTimePicker(),
                  ],
                ), //시간

                const SizedBox(height: 50,),

                const Column(
                  children: [
                    Memo()
                  ],
                ), //메모

                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      )
    );
  }
}
