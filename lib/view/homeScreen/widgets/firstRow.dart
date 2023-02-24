import 'package:bhaile/constants/AppColors.dart';
import 'package:bhaile/widgets/boldText.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FirstRow extends StatelessWidget {
  const FirstRow({
    super.key,
    required this.w,
  });

  final double w;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: w / 80.0),
          child: InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Icon(Icons.menu),
          ),
        ),
        BoldText(text: 'Bhaile', size: 16.sp),
        Padding(
          padding: EdgeInsets.only(right: w / 30),
          child: CircleAvatar(
            radius: w / 19,
            backgroundColor: AppColors.OFF_WHITE,
            child: CircleAvatar(
              backgroundColor: AppColors.WHITE,
              radius: w / 21,
              child: CircleAvatar(
                  radius: w / 23, child: Image.asset('assets/logo.png')),
            ),
          ),
        )
      ],
    );
  }
}
