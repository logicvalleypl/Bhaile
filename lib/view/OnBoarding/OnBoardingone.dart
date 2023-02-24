import 'package:bhaile/widgets/Texts.dart';
import 'package:bhaile/widgets/boldText.dart';
import 'package:bhaile/widgets/circularButton.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../homeScreen/homeScreen.dart';

class OnBoardingone extends StatelessWidget {
  const OnBoardingone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(width / 40),
                    child: Image.asset(
                      "assets/Logo/logo.png",
                      width: width / 5,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 12,
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 18.sp),
                    child: Rich_Text(
                        texta: "Find the best place \nto stay in",
                        textb: " good price",
                        size: 20.sp),
                  ),
                  SizedBox(
                    height: height / 36,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18.sp),
                    child: NormalText(
                        text:
                            'You will find best places according\nto your price',
                        size: 10.sp),
                  ),
                ],
              ),
            ],
          ),

          //there is some work left with this screen. the borders are different.
          Padding(
              padding: EdgeInsets.only(left: 7.sp, right: 7.sp),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    "assets/OnBoarding/obaordingback.png",
                  ),
                  fit: BoxFit.fill,
                )),
                width: width,
                height: height / 1.8,
                child: //Container()
                    Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircularButton(
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen(
                                      notLoggedIn: true,
                                    )));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => OnBoardingtwo()));
                      },
                      heightDivididedBy: 12,
                      text: 'Next',
                      widthDividedBy: 1.35,
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                  ],
                ),
              )),
        ],
      ),
    ));
  }
}
