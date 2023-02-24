import 'package:flutter/foundation.dart';

class LoginController extends ChangeNotifier {
  String type = ''; // 1=Tanel, 2=Land Lord, 3=Agent
  changeType({required String type}) {
    this.type = type;
  }

  bool showPassword = true;

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

  validatePassword(String? e) {
    if (e == null) {
      return "Please provide your password";
    }
    if (e.isEmpty) {
      return "Please provide your password";
    }
    if (e.length < 6) {
      return "The password must be mroe than 6 characters";
    }
    return null;
  }
}
