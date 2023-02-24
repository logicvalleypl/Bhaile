import 'package:bhaile/view/Login/Login.dart';
import 'package:bhaile/view/Signup/Signup_one.dart';
import 'package:bhaile/widgets/Buttons.dart';
import 'package:bhaile/widgets/Texts.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/circularButton.dart';

class OnBoardingtwo extends StatelessWidget {
  const OnBoardingtwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(height / 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // SizedBox(
                    //   width: width / 40,
                    // ),
                    Image.asset(
                      "assets/OnBoarding/Signupa.png",
                      width: width / 2.2,
                      fit: BoxFit.fill,
                    ),
                    // SizedBox(
                    //   width: width / 30,
                    // ),
                    Image.asset(
                      "assets/OnBoarding/Signupb.png",
                      width: width / 2.2,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
              // SizedBox(height: height / 8000000),
              Padding(
                padding: EdgeInsets.all(height / 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // SizedBox(
                    //   width: width / 40,
                    // ),
                    Image.asset(
                      "assets/OnBoarding/Signupc.png",
                      width: width / 2.2,
                      fit: BoxFit.fill,
                    ),
                    // SizedBox(
                    //   width: width / 30,
                    // ),
                    Image.asset(
                      "assets/OnBoarding/Signupd.png",
                      width: width / 2.2,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: height / 26,
          ),
          Align(
            alignment: Alignment(-0.6.sp, 0.sp),
            child:
                Rich_Text(texta: "Ready to", textb: " explore?", size: 20.sp),
          ),
          SizedBox(
            height: height / 12,
          ),
          Align(
            alignment: Alignment(0.sp, 0.sp),
            child: CircularButton(
              ontap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              heightDivididedBy: 12,
              text: 'Continue with Email',
              widthDividedBy: 1.35,
            ),
          ),
          SizedBox(height: height / 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SimpleText(
                  text: "Don't have an account?",
                  color: Colors.black,
                  size: 12.sp),
              Text_Button(
                  text: "Register?",
                  ontap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Signup_one()));
                  }),
            ],
          ),
        ],
      )
          //   ],
          // ),
          ),
    );
  }
}
