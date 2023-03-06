import 'package:flutter/foundation.dart';

class LoginController extends ChangeNotifier {
  String type = ''; // 1=Tanel, 2=Land Lord, 3=Agent
  changeType({required String type}) {
    this.type = type;
  }

  String? pass;
  bool showPassword = true;

  setShowPassword(bool a) {
    showPassword = a;
    notifyListeners();
  }

  validatedate(String e) {
    if (e.isEmpty) {
      return "Please add issued date";
    }
    return null;
  }

  validateccv(String e) {
    if (e.isEmpty) {
      return "Please add CCV";
    }
    return null;
  }

  validateEmail(String e) {
    if (e.isEmpty) {
      return "Please provide your email";
    }
    return null;
  }

  validatename(String e) {
    if (e.isEmpty) {
      return "Please enter name";
    }
    return null;
  }

  validatephone(String e) {
    if (e.isEmpty) {
      return "Please enter your phone number";
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
      return "The password must be more than 6 characters";
    }
    return null;
  }

  validatechangePassword(String? e) {
    if (e == null) {
      return "Please provide your password";
    }
    if (e.isEmpty) {
      return "Please provide your password";
    }
    if (e.length < 6) {
      return "The password must be more than 6 characters";
    }
    return null;
  }
  validatesavePassword(String? e) {
    if (e == null) {
      return "Please provide your password";
    }
    if (e.isEmpty) {
      return "Please provide your password";
    }
    if (e.length < 6) {
      return "The password must be more than 6 characters";
    }
    pass=e;
  }

  validatecnfrmPassword(String? e) {
    if (e == null) {
      return "Please provide your password";
    }
    if (e.isEmpty) {
      return "Please provide your password";
    }
    if (e.length < 6) {
      return "The password must be more than 6 characters";
    }
    if(pass != e)
      {
        return "The passwords do not match";
      }
    return null;
  }





}
