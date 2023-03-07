import 'package:flutter/cupertino.dart';
import 'package:bhaile/Widgets/Payment_widgets.dart';

class Offers_Controller with ChangeNotifier {


  int num = 0;
  changeCheck(int a) {
    num = a;
    notifyListeners();
  }

}
