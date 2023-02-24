import 'package:bhaile/widgets/boldText.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/AppColors.dart';

class OptionButton extends StatelessWidget {
  OptionButton({
    super.key,
    required this.ontap,
    this.heightDivididedBy = 16,
    required this.text,
    this.widthDividedBy = 2,
  });

  String text;
  double widthDividedBy;
  double heightDivididedBy;
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: ontap,
      child: Container(
          alignment: Alignment.center,
          width: width / widthDividedBy,
          height: height / heightDivididedBy,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                AppColors.PRIMARY,
                AppColors.PRIMARY_DARK,
                // AppColors.PRIMARY
              ], begin: Alignment.center, end: Alignment.bottomCenter),
              borderRadius: BorderRadius.circular(25)),
          padding: EdgeInsets.only(left: width / 20, right: width / 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BoldText(
                color: AppColors.WHITE,
                text: text,
                size: 12.sp,
              ),
              Icon(
                Icons.arrow_forward,
                color: AppColors.WHITE,
              )
            ],
          )),
    );
  }
}
