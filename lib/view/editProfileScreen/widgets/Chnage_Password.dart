import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/AppColors.dart';
import '../../../Widgets/Texts.dart';
import '../../../widgets/circularButton.dart';
import '../../../widgets/myTextField.dart';

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
    return Column(
      children: [
        Bold_Text(
            text: "Change Password",
            color: AppColors.PRIMARY_DARK,
            size: 12.sp),
        Padding(
          padding: EdgeInsets.all(w / 60),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(w / 40),
                child: MyTextField(
                    text: "Old Password",
                    icon: Icon(Icons.lock_outline),
                    validate: (String? a) {},
                    isPassword: true,
                    ctrl: passwordCtrl),
              ),
              Padding(
                padding: EdgeInsets.all(w / 40),
                child: MyTextField(
                    text: "New Password",
                    icon: Icon(Icons.lock_outline),
                    validate: (String? a) {},
                    isPassword: true,
                    ctrl: passwordCtrl),
              ),
              Padding(
                padding: EdgeInsets.all(w / 40),
                child: MyTextField(
                    text: "Confirm Password",
                    icon: Icon(Icons.lock_outline),
                    validate: (String? a) {},
                    isPassword: true,
                    ctrl: passwordCtrl),
              ),
              SizedBox(
                height: h / 80,
              ),
              CircularButton(
                ontap: () {},
                heightDivididedBy: 12,
                text: 'Change Password',
                widthDividedBy: 1.35,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
