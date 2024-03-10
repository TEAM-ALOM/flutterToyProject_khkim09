import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDatePicker extends StatefulWidget {
  const MyDatePicker({super.key});

  @override
  State<MyDatePicker> createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  DateTime selectedDate = DateTime.now(); //사용자가 고른 날짜 저장할 변수 (DateTime type)

  selectDate() { //날짜 선택 버튼 클릭 시 실햄 함수
    setState(() {
      showDatePicker(context: context, firstDate: DateTime(2024), lastDate: DateTime(2025,12,31)).then((date) {
        setState(() { //showDatePicker: 달력 출력 / then 통해 (date)를 저장
          selectedDate = date!;
        });
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text("날 짜", style: TextStyle(fontSize: 20),),
        const SizedBox(width: 30,),
        Text("${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일", style: const TextStyle(fontSize: 17)),
        const SizedBox(width: 40),
        ElevatedButton(onPressed: selectDate, //버튼 클릭 시 selectDate 함수 호출
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.deepPurpleAccent,
              padding: const EdgeInsets.symmetric(horizontal: 13)
            ),
            child: const Text('날짜 선택', style: TextStyle(fontSize: 17))
        ),
      ],
    );
  }
}
