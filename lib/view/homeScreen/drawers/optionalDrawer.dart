import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/AppColors.dart';
import '../../../widgets/boldText.dart';

class OptionalDrawer extends StatelessWidget {
  const OptionalDrawer({
    super.key,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: h / 80,
              ),
              Image.asset(
                'assets/logo.png',
                width: w / 2,
                height: h / 12,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: h / 100,
              ),
              BoldText(text: 'Bhaile', size: 16.sp),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: w / 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h / 20,
                ),
                BoldText(
                  text: 'Services',
                  size: 10.sp,
                  color: AppColors.PRIMARY_DARK,
                ),
                SizedBox(
                  height: h / 40,
                ),
                BoldText(
                  text: 'Listings',
                  size: 10.sp,
                  color: AppColors.PRIMARY_DARK,
                ),
                SizedBox(
                  height: h / 40,
                ),
                BoldText(
                  text: 'Agents',
                  size: 10.sp,
                  color: AppColors.PRIMARY_DARK,
                ),
                SizedBox(
                  height: h / 40,
                ),
                BoldText(
                  text: 'Contacts',
                  size: 10.sp,
                  color: AppColors.PRIMARY_DARK,
                ),
                SizedBox(
                  height: h / 40,
                ),
                BoldText(
                  text: 'Reviews',
                  size: 10.sp,
                  color: AppColors.PRIMARY_DARK,
                ),
                SizedBox(
                  height: h / 40,
                ),
                BoldText(
                  text: 'Sign Up',
                  size: 10.sp,
                  color: AppColors.PRIMARY_DARK,
                ),
                SizedBox(
                  height: h / 40,
                ),
                BoldText(
                  text: 'Sign In',
                  size: 10.sp,
                  color: AppColors.PRIMARY_DARK,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
