import 'package:alarm_ui/theme.dart';

import 'enums.dart';
import 'model/alarm_info.dart';
import 'model/menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(Menu.clock, 'Clock', 'assets/clock_icon.png'),
  MenuInfo(Menu.alarm, 'Alarm', 'assets/alarm_icon.png'),
  MenuInfo(Menu.timer, 'Timer', 'assets/timer_icon.png'),
  MenuInfo(Menu.stopwatch, 'Stopwatch', 'assets/stopwatch_icon.png'),
];

List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now().add(const Duration(hours: 1)), false,
      description: 'Office', grade: GradientColors.sky),
  AlarmInfo(DateTime.now().add(const Duration(hours: 2)), false,
      description: 'Sport', grade: GradientColors.sunset)
];
