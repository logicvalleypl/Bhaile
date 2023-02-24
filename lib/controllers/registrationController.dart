import 'package:flutter/foundation.dart';

class RegisterationController extends ChangeNotifier {
  int seconds = 60;

  bool showPassword = true;
  chanegSecons() async {
    for (int i = 60; i >= 0; i--) {
      if (seconds != 0) {
        await Future.delayed(Duration(seconds: 1));
        seconds--;
        notifyListeners();
      }
    }

    notifyListeners();
  }

  setShowPassword(bool a) {
    showPassword = a;
    notifyListeners();
  }

  validateEmail(String e) {
    if (e.isEmpty) {
      return "Please provide your email";
    }
    return null;
  }

  validateName(String e) {
    if (e.isEmpty) {
      return "Please provide your name";
    }
    return null;
  }

  validatePassword(String e) {
    if (e.isEmpty) {
      return "Please provide your password";
    }
    if (e.length < 6) {
      return "The password must be mroe than 6 characters";
    }
    return null;
  }
}
