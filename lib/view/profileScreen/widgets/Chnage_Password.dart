
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/AppColors.dart';
import '../../../Widgets/Texts.dart';
import '../../../controllers/loginController.dart';
import '../../../widgets/Form_Feilds.dart';
import '../../../widgets/circularButton.dart';

var passkey = GlobalKey<FormState>();
class Change_Password extends StatelessWidget {
  const Change_Password({
    super.key,
    required this.w,
    required this.passwordCtrl,
    required this.h,
  });

  final double w;
  final TextEditingController passwordCtrl;
  final double h;

  @override
  Widget build(BuildContext context) {

    var CPController = context.read<LoginController>();
    TextEditingController oldpctrl = new TextEditingController();   //old password
    TextEditingController newpctrl = new TextEditingController();  // new password
    TextEditingController cnfrmpctrl = new TextEditingController();  //confirm password
    return Column(
      children: [
        Bold_Text(
            text: "Change Password",
            color: AppColors.PRIMARY_DARK,
            size: 12.sp),
        Padding(
          padding: EdgeInsets.all(w / 60),
          child: Form(
              key:passkey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(w / 40),
                  child: Input_Feild(
                      text: "Old Password",
                      icon: Icon(Icons.lock_outline),
                      validate: (s)=>CPController.validatechangePassword(s!),
                      isPassword: true,
                      ctrl: oldpctrl),
                ),
                Padding(
                  padding: EdgeInsets.all(w / 40),
                  child: Input_Feild(
                      text: "New Password",
                      icon: Icon(Icons.lock_outline),
                      validate: (s)=>CPController.validatesavePassword(s!),
                      isPassword: true,
                      ctrl: newpctrl),
                ),
                Padding(
                  padding: EdgeInsets.all(w / 40),
                  child: Input_Feild(
                      text: "Confirm Password",
                      icon: Icon(Icons.lock_outline),
                      validate: (s)=>CPController.validatecnfrmPassword(s!),
                      isPassword: true,
                      ctrl: cnfrmpctrl),
                ),
                SizedBox(
                  height: h / 80,
                ),
                CircularButton(
                  ontap: () {
                    if(passkey.currentState!.validate())
                      {

                        print("SD");
                      }
                  },
                  heightDivididedBy: 12,
                  text: 'Change Password',
                  widthDividedBy: 1.35,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}