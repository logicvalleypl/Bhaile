import 'package:bhaile/view/Login/loginScreen.dart';
import 'package:bhaile/view/Welcome_Screens/Location_one.dart';
import 'package:bhaile/widgets/Buttons.dart';
import 'package:bhaile/widgets/Texts.dart';
import 'package:bhaile/widgets/circularButton.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/myTextField.dart';

class Location_two extends StatefulWidget {
  const Location_two({Key? key}) : super(key: key);

  @override
  State<Location_two> createState() => _Location_twoState();
}

class _Location_twoState extends State<Location_two> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Positioned(
                top: 10.sp,
                left: 10.sp,
                child: SmallButton(
                  text: "<",
                  ontap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Location_one()));
                  },
                  check: false,
                ),
              ),
              Positioned(
                top: 10.sp,
                right: 10.sp,
                child: SmallButton(
                  text: "skip",
                  ontap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  check: true,
                ),
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height / 7,
                  ),
                  Align(
                    alignment: Alignment(-0.8, 0),
                    child: Rich_Text(
                      texta: "Add your",
                      textb: " location",
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Align(
                    alignment: Alignment(-0.7, 0),
                    child: SimpleText(
                        text:
                            "you can change this later on your acount seeting.",
                        size: 12,
                        color: Colors.black),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height / 4,
                        ),
                        MyTextField(
                            validate: (a) {},
                            ctrl: TextEditingController(),
                            text: "Location Detail",
                            icon: Icon(Icons.location_on_sharp)),
                        SizedBox(
                          height: height / 6,
                        ),
                        CircularButton(
                          ontap: () {},
                          heightDivididedBy: 12,
                          text: 'Next',
                          widthDividedBy: 1.35,
                        )
                        // MainButton(
                        //   text: "Next",
                        //   ontap: () {},
                        //   height: height,
                        //   width: width,
                        //   color: AppColors.PRIMARY,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              //TextButton(onPressed: , child: child)
            ],
          ),
        ),
      ),
    );
  }
}
