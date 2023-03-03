import 'package:bhaile/Constants/AppColors.dart';
import 'package:bhaile/Widgets/Texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/Form_Feilds.dart';
import '../../../widgets/circularButton.dart';
import 'Add_Document.dart';

class Edit_Profile_Widget extends StatelessWidget {
  const Edit_Profile_Widget({
    super.key,
    required this.h,
    required this.w,
    required this.passwordCtrl,
  });

  final double h;
  final double w;
  final TextEditingController passwordCtrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: h / 35,
        ),
        Image.asset("assets/Home/sample.png"),
        SizedBox(
          height: h / 60,
        ),
        Padding(
          padding: EdgeInsets.all(w / 60),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(w / 40),
                  child: Input_Feild(
                      text: "Name",
                      icon: Icon(Icons.person),
                      validate: (String? a) {},
                      isPassword: false,
                      ctrl: passwordCtrl),
                ),
                Padding(
                  padding: EdgeInsets.all(w / 40),
                  child: Input_Feild(
                      text: "Phone",
                      icon: Icon(Icons.phone),
                      validate: (String? a) {},
                      isPassword: false,
                      ctrl: passwordCtrl),
                ),
                Padding(
                  padding: EdgeInsets.all(w / 40),
                  child: Input_Feild(
                      text: "Email",
                      icon: Icon(Icons.email_outlined),
                      validate: (String? a) {},
                      isPassword: false,
                      ctrl: passwordCtrl),
                ),
                Padding(
                  padding: EdgeInsets.all(w / 40),
                  child: Input_Feild(
                      text: "Address",
                      icon: Icon(Icons.location_on_sharp),
                      validate: (String? a) {},
                      isPassword: false,
                      ctrl: passwordCtrl),
                ),
                Padding(
                  padding: EdgeInsets.all(w / 40),
                  child: Input_Feild(
                      text: "Zip Code",
                      icon: Icon(Icons.code),
                      validate: (String? a) {},
                      isPassword: false,
                      ctrl: passwordCtrl),
                ),
                Padding(
                  padding: EdgeInsets.all(w / 40),
                  child: Column(
                    children: [
                      Add_Document(
                          w: w,
                          h: h,
                          text: "Business Card",
                          icon: Icon(
                            Icons.credit_card,
                            color: AppColors.PRIMARY_DARK,
                          )),
                      SizedBox(
                        height: h / 30,
                      ),
                      Add_Document(
                          w: w,
                          h: h,
                          text: "Address Proof",
                          icon: Icon(Icons.location_on_sharp,
                              color: AppColors.PRIMARY_DARK)),
                      SizedBox(
                        height: h / 30,
                      ),
                      Add_Document(
                          w: w,
                          h: h,
                          text: "Business Document",
                          icon: Icon(Icons.document_scanner,
                              color: AppColors.PRIMARY_DARK)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: h / 80,
        ),
        CircularButton(
          ontap: () {},
          heightDivididedBy: 12,
          text: 'Confirm',
          widthDividedBy: 1.35,
        ),
      ],
    );
  }
}
