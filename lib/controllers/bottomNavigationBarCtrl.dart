import 'package:bhaile/controllers/profileControllers/profileController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarCtrl extends ChangeNotifier {
  int index = 0;
  changeIndex(int i, BuildContext context) {
    index = i;
    if (index == 2) {
      // EasyLoading.show(status: 'Loading')
      context.read<ProfileController>().getProfile();
    }
    notifyListeners();
  }
}
