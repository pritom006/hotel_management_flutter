import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckOutProvider with ChangeNotifier {
  final DateTime _date = DateTime.now();
  Future<DateTime?> selectDate(BuildContext context) => showDatePicker(
        context: context,
        initialDate: _date.add(const Duration(microseconds: 1)),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );

  Future<TimeOfDay?> selectTime(BuildContext context) => showTimePicker(
        context: context,
        initialTime: TimeOfDay(
          hour: _date.hour,
          minute: _date.minute,
        ),
      );
}
