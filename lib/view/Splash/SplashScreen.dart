import 'package:bhaile/view/OnBoarding/OnBoardingone.dart';
import 'package:bhaile/widgets/circularButton.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/AppColors.dart';
import '../../widgets/boldText.dart';
import '../Offers/Offers.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Image.asset('assets/Splash/splashback.png',
                width: width, fit: BoxFit.fill),
          ),
          Positioned(
            bottom: 0,
            child: Image.asset('assets/Splash/Fader.png',
                width: width, fit: BoxFit.contain),
          ),
          Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  // height: height / 10,
                  ),
              // SizedBox(
              //   height: height / 10,
              // ),
              // SizedBox(
              //   height: height / 6,
              // ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: height / 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/Logo/logo.png",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 80,
                  ),
                  BoldText(
                      text: "Rise \n Real Estate",
                      size: 25.sp,
                      color: AppColors.WHITE),
                ],
              ),
              SizedBox(
                  // height: height / 5,
                  ),
              CircularButton(
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OnBoardingone()));
                  },
                  heightDivididedBy: 11,
                  text: 'Lets Start',
                  widthDividedBy: 1.3),

              SizedBox()
            ],
          )
        ],
      ),
    ));
  }
}
