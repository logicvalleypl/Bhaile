import 'package:bhaile/widgets/circularButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';

import '../../constants/AppColors.dart';
import '../../widgets/boldText.dart';
import '../OnBoarding/OnBoardingone.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({
    super.key,
    required this.showLoading,
  });
  bool showLoading;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.doubleBounce
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = AppColors.WHITE
      ..backgroundColor = Colors.transparent
      ..indicatorColor = AppColors.GREYLIGHT
      ..textColor = AppColors.PRIMARY_DARK
      ..maskColor = AppColors.PRIMARY_DARK.withOpacity(0.5)
      ..maskType = EasyLoadingMaskType.black
      ..userInteractions = false
      ..textColor = AppColors.WHITE
      ..dismissOnTap = false;

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
                  SizedBox(
                    height: height / 20,
                  ),
                  if (showLoading) CircularProgressIndicator(),
                ],
              ),
              SizedBox(
                  // height: height / 5,
                  ),
              if (!showLoading)
                CircularButton(
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  //  BottomNavigationBarScreen()));
                                  OnBoardingone()));
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
