import 'package:flutter/cupertino.dart';
import 'FinishTime.dart';
import 'StartTime.dart';

class MyTimePicker extends StatefulWidget {
  const MyTimePicker({super.key});

  @override
  State<MyTimePicker> createState() => _MyTimePickerState();
}

class _MyTimePickerState extends State<MyTimePicker> {
  @override
  Widget build(BuildContext context) {
    return const Column(
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
    );
  }
}
