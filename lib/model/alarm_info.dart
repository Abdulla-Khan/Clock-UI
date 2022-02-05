import 'package:flutter/cupertino.dart';

class AlarmInfo {
  DateTime alarmDataTime;
  String description;
  List<Color> grade;
  bool isActive = false;
  AlarmInfo(
    this.alarmDataTime,
    this.isActive, {
    required this.description,
    required this.grade,
  });
}
