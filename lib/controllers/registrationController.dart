import 'package:bhaile/services/network/globalApi.dart';
import 'package:bhaile/services/repos/authRepo.dart';
import 'package:bhaile/view/Signup/Authenticate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../view/bottomNavBar/bottomNavigationBar.dart';

class RegisterationController extends ChangeNotifier {
  int seconds = 60;
  String type = ''; // 1=Tanel, 2=Land Lord, 3=Agent
  changeType({required String type}) {
    this.type = type;
  }

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

  validateFirst(String e) {
    if (e.isEmpty) {
      return "Please provide your First Name";
    }
    return null;
  }

  validateLastName(String e) {
    if (e.isEmpty) {
      return "Please provide your Last Name";
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

  void signUp({
    required BuildContext context,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    EasyLoading.show();
    var res = await AuthRepo.signUp(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        userType: type);
    if (res != null) {
      sshowSnackBar(res['message']);
      EasyLoading.dismiss();
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Authenticate(
                email: email,
              )));
    }
  }

  void verifyCode(
      {required String code,
      required String email,
      required BuildContext context}) async {
    EasyLoading.show();
    var response = await AuthRepo.verifyCode(code: code, email: email);
    if (response != null) {
      EasyLoading.dismiss();
      sshowSnackBar(response['message']);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (c) => BottomNavigationBarScreen()));
    }
    EasyLoading.dismiss();
  }
}
