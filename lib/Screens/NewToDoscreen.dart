import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import '../Widgets/FinishTime.dart';
import '../Widgets/MyDatePicker.dart';
import '../Widgets/StartTime.dart';

class NewToDoScreen extends StatefulWidget {
  const NewToDoScreen({super.key});

  @override
  State<NewToDoScreen> createState() => _NewToDoScreenState();
}

class _NewToDoScreenState extends State<NewToDoScreen> {
  save() { //완료 클릭 시 할 일 저장 (구현 필요) - 할 일 공란 시 경고창 생성 추가

  }

  /*TextEditingController NewToDo = TextEditingController(); //controller: TextEditingController - textfield 입력 값 접근 위한 변수 */
  String inputText = ""; //textfield 초기값

  check() {
    if (inputText == "") {
      showDialog(context: context, builder: (BuildContext context) { //창 생성
        return AlertDialog( //경고창 띄우기
          title: const Text("잠깐!!!", style: TextStyle(fontSize: 25),),
          content: const Text("할 일을 작성해주세요!"),
          actions: [
            IconButton(
              icon: const Text("작성하기", style: TextStyle(color: Colors.deepPurpleAccent),),
              onPressed: () {
                Navigator.pop(context); //'작성하기' 클릭 시 textfield로 넘어가게끔 수정 필요!!!
              },
            )
          ],
        );
      });
    }
  }

  Future<void> inputTodo(String text) async{
    setState(() {
      inputText = text;
    });
    check();
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
          IconButton(onPressed: save, icon: const Text("완료", style: TextStyle(fontSize: 18),)) //!!!!Save 구현 필요!!!!
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          check(); //textfield 이외 부분 터치 시 키보드 사라짐
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("할 일", style: TextStyle(fontSize: 20),),
                    TextField(onChanged: inputTodo), //'할 일' 작성 함수 호출
                  ],
                ),


                const SizedBox(height: 20,),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyDatePicker(),
                  ],
                ),

                const SizedBox(height: 60,),

                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("시 간", style: TextStyle(fontSize: 20),),
                    SizedBox(height: 30,),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("시작시간"),
                            Text("종료시간"),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            StartTime(),
                            FinishTime()
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 50,),

                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("메 모", style: TextStyle(fontSize: 20),),
                    SizedBox(height: 20,),
                    TextField(maxLines: 15, decoration: InputDecoration(border: OutlineInputBorder()),)
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
