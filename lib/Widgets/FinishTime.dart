import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FinishTime extends StatefulWidget {
  final Function(DateTime) finishTimeChanged;

  const FinishTime({super.key, required this.finishTimeChanged});

  @override
  State<FinishTime> createState() => _FinishTimeState();
}

class _FinishTimeState extends State<FinishTime> {
  DateTime _selectedTime = DateTime.now();

  Future<void> selectTime(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) =>
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.3,
            child: CupertinoDatePicker(
              backgroundColor: Colors.white,
              initialDateTime: _selectedTime,
              use24hFormat: false,
              mode: CupertinoDatePickerMode.time,
              onDateTimeChanged: (DateTime newTime) {
                setState(() {
                  _selectedTime = newTime;
                });
              },
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () {
                    selectTime(context);
                    widget.finishTimeChanged(_selectedTime);
                  },
                  child: Text(DateFormat("HH : mm").format(_selectedTime), style: const TextStyle(fontSize: 20, color: Colors.black),)
              )
          ),
        ],
      ),
    );
  }
}