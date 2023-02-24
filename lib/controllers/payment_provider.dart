import 'package:flutter/cupertino.dart';
import 'package:bhaile/Widgets/Payment_widgets.dart';

class MyProvider with ChangeNotifier {
  // int _check=0;

  int check = 0;
  changeCheck(int a) {
    check = a;
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
