import 'package:alarm_ui/data.dart';
import 'package:alarm_ui/theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Alarm',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
          ),
          Expanded(
            child: ListView(
              children: alarms
                  .map<Widget>((alarm) => Container(
                        margin: const EdgeInsets.only(bottom: 32),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: alarm.grade,
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight),
                            boxShadow: [
                              BoxShadow(
                                  color: alarm.grade.last.withOpacity(0.4),
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                  offset: const Offset(4, 4))
                            ],
                            borderRadius: BorderRadius.circular(24)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.label,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Office',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Switch(
                                  value: true,
                                  onChanged: (bool value) {},
                                  activeColor: Colors.white,
                                )
                              ],
                            ),
                            const Text('Mon-Fri',
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('7:00 AM',
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700)),
                                Icon(Icons.keyboard_arrow_down,
                                    color: Colors.white, size: 36),
                              ],
                            ),
                          ],
                        ),
                      ))
                  .followedBy([
                DottedBorder(
                  strokeWidth: 3,
                  color: CustomColors.clockOutline,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(24),
                  dashPattern: const [5, 4],
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 32),
                    decoration: BoxDecoration(
                        color: CustomColors.clockBG,
                        borderRadius: BorderRadius.circular(24)),
                    child: MaterialButton(
                      highlightColor: CustomColors.clockBG,
                      hoverColor: CustomColors.clockBG,
                      focusColor: CustomColors.clockBG,
                      splashColor: CustomColors.clockBG,
                      onPressed: () {},
                      elevation: 0,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/add_alarm.png',
                            scale: 1.5,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Add Alarm',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ]).toList(),
            ),
          )
        ],
      ),
    );
  }
}
