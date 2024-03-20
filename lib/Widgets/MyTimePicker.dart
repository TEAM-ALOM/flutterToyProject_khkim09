import 'package:flutter/cupertino.dart';
import 'FinishTime.dart';
import 'StartTime.dart';

class MyTimePicker extends StatefulWidget {
  const MyTimePicker({super.key});

  @override
  State<MyTimePicker> createState() => _MyTimePickerState();
}

class _MyTimePickerState extends State<MyTimePicker> {
  late DateTime startTime = DateTime(2500);
  late DateTime finishTime = DateTime(1900);
  late bool check = false; //그냥 startime, finishtime.dart에서 각각 체크 후 bool값을 반환받고 mytimepicker에서는 bool값 최신화

  void startTimeUpdate(DateTime st) {
    setState(() {
      startTime = st;
    });
  }
  void finishTimeUpdate(DateTime ft) {
    setState(() {
      finishTime = ft;
    });
  }
  void checkTime() {
    if ((startTime.isBefore(DateTime.now()) || startTime.isAtSameMomentAs(DateTime.now())) &&
        (finishTime.isAfter(DateTime.now()) || finishTime.isAtSameMomentAs(DateTime.now()))) {
      setState(() {
        check = true;
      });
    }
  }
  bool? getValue() {
    return check;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  StartTime(startTimeChanged: startTimeUpdate,),
                  FinishTime(finishTimeChanged: finishTimeUpdate,)
                ],
              ),
            ],
          ),
        ],
    );
  }
}
