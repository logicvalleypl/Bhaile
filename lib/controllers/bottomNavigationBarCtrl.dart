import 'package:flutter/material.dart';

class BottomNavigationBarCtrl extends ChangeNotifier {
  int index = 0;
  changeIndex(int i) {
    index = i;
    notifyListeners();
  }
}
