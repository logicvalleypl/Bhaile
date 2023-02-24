import 'package:bhaile/Constants/AppColors.dart';
import 'package:bhaile/controllers/registrationController.dart';
import 'package:bhaile/view/bottomNavBar/bottomNavigationBar.dart';
import 'package:bhaile/widgets/Buttons.dart';
import 'package:bhaile/widgets/Texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<RegisterationController>().chanegSecons();
    });
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: width / 80, top: height / 120),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.GREY,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.WHITE,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height / 7,
                  ),

                  Rich_Text(texta: "Enter the", textb: " Code", size: 20.sp),

                  SizedBox(
                    height: height / 18,
                  ),

                  OtpTextField(
                    numberOfFields: 4,
                    borderColor: AppColors.PRIMARY,
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text('Code has been verified successfully')));
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (c) => BottomNavigationBarScreen()));
                      // showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return AlertDialog(
                      //         title: Text("Verification Code"),
                      //         content:
                      //             Text('Code entered is $verificationCode'),
                      //       );
                      //     });
                    }, // end onSubmit
                  ),

                  SizedBox(
                    height: height / 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SimpleText(
                          text: "Didn't receive the OTP",
                          color: Colors.black,
                          size: 15),
                      Selector<RegisterationController, int>(
                          selector: (a, b) => b.seconds,
                          builder: (context, seconds, child) {
                            return seconds == 0
                                ? Text_Button(text: "Resend OTP", ontap: () {})
                                : Text_Button(
                                    text: "Resend code in $seconds",
                                    ontap: () {});
                          }),
                    ],
                  ),
                  //TextButton(onPressed: , child: child)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
