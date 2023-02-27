import 'package:flutter/foundation.dart';

class HomeScreenController extends ChangeNotifier {

  int a=0;

  changeIndex(int i) {
    a = i;
    notifyListeners();
  }



}
