import 'package:alarm_ui/enums.dart';
import 'package:flutter/cupertino.dart';

class MenuInfo extends ChangeNotifier {
  Menu menu;
  String title;
  String image;

  MenuInfo(this.menu, this.title, this.image);

  updateMenu(MenuInfo mi) {
    menu = mi.menu;
    title = mi.title;
    image = mi.image;

    notifyListeners();
  }
}
