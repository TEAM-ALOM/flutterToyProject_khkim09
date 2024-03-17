import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoText extends StatefulWidget {
  const ToDoText({super.key});

  @override
  State<ToDoText> createState() => _ToDoTextState();
}

class _ToDoTextState extends State<ToDoText> {
  TextEditingController newToDo = TextEditingController(); //controller: TextEditingController - textfield 입력 값 접근 위한 변수
  bool isTouched = false;

  check() {
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
          onTap: () => setState(() { //textfield 한 번 건드리기 전까진 무반응
            isTouched = true; //한 번이라도 건드리면 textfield 채워야만 넘어가기 가능
          }),
          onEditingComplete: () { //입력 완료 시 check 함수 호출
            check();
            FocusScope.of(context).unfocus(); //키보드 사라짐
          },
        ),
      ],
    );
  }
}
