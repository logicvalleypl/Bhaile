import 'package:flutter/cupertino.dart';
import 'package:bhaile/Widgets/Payment_widgets.dart';

class MyProvider with ChangeNotifier {
  // int _check=0;

  int num = 0;
  changeCheck(int a) {
    num = a;
    notifyListeners();
  }
  // int get check => _check;
  //
  // void paypal_button(double height,double width)
  // {
  //
  //   _check==1;
  //   notifyListeners();
  //
  //
  // }
  //
  // void Master_button(double height,double width)
  // {
  //
  //   _check==2;
  //   notifyListeners();
  //
  //
  // }
}
