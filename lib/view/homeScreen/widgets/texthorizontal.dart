import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/AppColors.dart';
import '../../../widgets/boldText.dart';

class TextHorzWidget extends StatelessWidget {
  TextHorzWidget({
    super.key,
    required this.w,
    required this.text,
  });

  final double w;
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: w / 20, right: w / 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BoldText(
            text: text,
            color: AppColors.PRIMARY_DARK,
            size: 14.sp,
          ),
          BoldText(
            text: 'view all',
            color: AppColors.PRIMARY_DARK,
            size: 7.sp,
          )
        ],
      ),
    );
  }
}
