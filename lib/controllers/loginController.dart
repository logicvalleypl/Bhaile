import 'package:bhaile/model/agentModel.dart';
import 'package:bhaile/model/landLordModel.dart';
import 'package:bhaile/model/tenantModel.dart';
import 'package:bhaile/services/network/globalApi.dart';
import 'package:bhaile/services/repos/authRepo.dart';
import 'package:bhaile/view/Login/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/Welcome_Screens/Location_one.dart';

class LoginController extends ChangeNotifier {
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

  validatePassword(String e) {
    if (e.isEmpty) {
      return "Please provide your password";
    }
    if (e.length < 6) {
      return "The password must be mroe than 6 characters";
    }
    return null;
  }

  void login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    EasyLoading.show();
    var response = await AuthRepo.signIn(email: email, password: password);
    if (response is TenantModel) {
      await response.save();
      sshowSnackBar('Logged in successfully');
      EasyLoading.dismiss();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Location_one()));
    }
    if (response is AgentModel) {
      await response.save();
      sshowSnackBar('Logged in successfully');
      EasyLoading.dismiss();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Location_one()));
    }
    if (response is LandLordModel) {
      await response.save();
      sshowSnackBar('Logged in successfully');
      EasyLoading.dismiss();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Location_one()));
    }
  }

  void signOut(String token, BuildContext context) async {
    EasyLoading.show();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (await AuthRepo.logout(token: token)) {
      await prefs.clear();
      EasyLoading.dismiss();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (c) => Login()));
    }
  }
}
