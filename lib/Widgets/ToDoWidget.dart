import 'package:flutter/material.dart';

class ToDoText extends StatefulWidget {
  final Function(String) onTextSubmitted;

  const ToDoText({super.key, required this.onTextSubmitted});

  @override
  State<ToDoText> createState() => _ToDoTextState();
}

class _ToDoTextState extends State<ToDoText> {
  TextEditingController newToDo = TextEditingController(); //controller: TextEditingController - textfield 입력 값 접근 위한 변수

  void check() {
    if (newToDo.text.isEmpty) {
      showDialog(context: context, builder: (BuildContext context) { //창 생성
        return AlertDialog( //경고창 띄우기
          title: const Text("잠깐!!!", style: TextStyle(fontSize: 25),),
          content: const Text("할 일을 작성해주세요!"),
          actions: [
            TextButton(
              child: const Text("작성하기", style: TextStyle(color: Colors.deepPurpleAccent),),
              onPressed: () {
                Navigator.pop(context); //'작성하기' 클릭 시 textfield로 넘어가게끔 수정 필요!!!
              },
            )
          ],
        );
      });
    }
  }

  @override
  void dispose() { //statefulwidget 제거 전 호출되는 method
    newToDo.dispose(); //textfield의 controller가 더 이상 필요없을 때 메모리 할당 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("할 일", style: TextStyle(fontSize: 20),),
        TextField(
          controller: newToDo, //textfield의 변환된 값 접근을 위한 장치
          onEditingComplete: () {//입력 완료 시 check 함수 호출
            check();
            FocusScope.of(context).unfocus(); //키보드 사라짐
            widget.onTextSubmitted(newToDo.text); //newToDo.text 값 부모에게 반환(ToDoText위젯 호출한 곳으로) stful이라 widget속성 사용
          },
        ),
      ],
    );
  }
}
