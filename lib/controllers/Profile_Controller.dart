import 'package:flutter/cupertino.dart';
import 'package:bhaile/Widgets/Payment_widgets.dart';

class Profile_Controller with ChangeNotifier {

  int check = 0;
  changeCheck(int a) {
    check = a;
    notifyListeners();
  }

}
