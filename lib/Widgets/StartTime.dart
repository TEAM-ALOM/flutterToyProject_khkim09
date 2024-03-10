import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scroll_time_picker/scroll_time_picker.dart';

class StartTime extends StatefulWidget {
  const StartTime({super.key});

  @override
  State<StartTime> createState() => _StartTimeState();
}

class _StartTimeState extends State<StartTime> {
  DateTime _selectedTime = DateTime.now();

  Future<void> selectTime(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: ScrollTimePicker(
            selectedTime: _selectedTime,
            is12hFormat: true,
            onDateTimeChanged: (DateTime value) {
              setState(() {
                _selectedTime = value;
              });
            },
          ),
        );
      },
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
              onPressed: () => selectTime(context),
              child: Text(DateFormat("HH : mm").format(_selectedTime), style: const TextStyle(fontSize: 20, color: Colors.black),)
            )
          ),
        ],
      ),
    );
  }
}
