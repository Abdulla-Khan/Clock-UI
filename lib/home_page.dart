import 'package:alarm_ui/clock_view.dart';
import 'package:alarm_ui/data.dart';
import 'package:alarm_ui/model/menu_info.dart';
import 'package:alarm_ui/view/clock.dart';
import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'package:provider/provider.dart';

import 'enums.dart';
import 'view/alarm.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedT = DateFormat('HH:mm').format(now);
    var formattedD = DateFormat('EEE, d MMM').format(now);
    var timezone = now.timeZoneOffset.toString().split('.').first;
    var off = '';
    if (!timezone.startsWith('-')) {
      off = '+';
    }
    return Scaffold(
        backgroundColor: const Color(0xFF2D2F41),
        body: Row(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems.map((cmi) => buildButton(cmi)).toList(),
          ),
          const VerticalDivider(
            color: Colors.white54,
            width: .5,
          ),
          Expanded(
            child: Consumer<MenuInfo>(builder: (context, value, child) {
              if (value.menu == Menu.clock) return ClockPage();
              if (value.menu == Menu.alarm) return AlarmPage();

              return Container(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
                child: RichText(
                    text: TextSpan(style: TextStyle(fontSize: 20), children: [
                  TextSpan(text: 'Work In Progress\n'),
                  TextSpan(text: value.title, style: TextStyle(fontSize: 40))
                ])),
              );
            }),
          ),
        ]));
  }

  Widget buildButton(MenuInfo cmi) {
    return Consumer<MenuInfo>(
        builder: (BuildContext context, MenuInfo info, Widget? child) {
      return MaterialButton(
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(32))),
        splashColor: const Color(0xFF2D2F41),
        color: cmi.menu == info.menu
            ? const Color(0xFF242634)
            : Colors.transparent,
        onPressed: () {
          var menuInfo = Provider.of<MenuInfo>(context, listen: false);
          menuInfo.updateMenu(cmi);
        },
        child: Column(
          children: [
            Image.asset(
              cmi.image,
              scale: 1.5,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              cmi.title,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      );
    });
  }
}
