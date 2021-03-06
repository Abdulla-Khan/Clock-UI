import 'package:alarm_ui/enums.dart';
import 'package:alarm_ui/model/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.blue,
      ),
      home: ChangeNotifierProvider<MenuInfo>(
          create: (context) => MenuInfo(Menu.clock, '', ''),
          child: const HomePage()),
    );
  }
}
