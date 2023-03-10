import 'package:bhaile/constants/AppColors.dart';
import 'package:bhaile/controllers/registrationController.dart';
import 'package:bhaile/view/OnBoarding/OnBoardingtwo.dart';
import 'package:bhaile/widgets/boldText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ThreeButtons extends StatelessWidget {
  const ThreeButtons({
    super.key,
    required this.w,
  });

  final double w;

  @override
  Widget build(BuildContext context) {
    var loginController = context.read<RegisterationController>();
    return Padding(
      padding: EdgeInsets.only(left: w / 20, right: w / 20),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FixedButton(
              w: w,
              text: 'Tanet',
              onTap: () {
                loginController.changeType(type: 'Tenant');
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => OnBoardingtwo()));
              },
            ),
            FixedButton(
              w: w,
              text: "Land Lord",
              onTap: () {
                loginController.changeType(type: 'landlord');
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => OnBoardingtwo()));
              },
            ),
            FixedButton(
              w: w,
              text: 'Agent',
              onTap: () {
                loginController.changeType(type: 'agent');
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => OnBoardingtwo()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FixedButton extends StatelessWidget {
  FixedButton({
    super.key,
    required this.w,
    required this.text,
    required this.onTap,
  });

  final double w;
  String text;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: w / 3.5,
        decoration: BoxDecoration(color: AppColors.PRIMARY_DARK),
        child: Padding(
          padding: EdgeInsets.all(w / 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NormalText(
                text: 'I am',
                size: 6.sp,
                color: AppColors.WHITE,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BoldText(
                    text: text,
                    size: 10.sp,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
