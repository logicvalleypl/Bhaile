import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/AppColors.dart';
import '../../../Widgets/Texts.dart';

class Profile_Box extends StatelessWidget {
  const Profile_Box({
    super.key,
    required this.w,
    required this.h,
    required this.texta,
    required this.textb,
  });

  final double w;
  final double h;
  final String texta;
  final String textb;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w/3.5,
      height: h/9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),

        border: Border.all(color: AppColors.GREY),
      ),

      child:Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SimpleText(text: texta, color: AppColors.PRIMARY_DARK, size: 10.sp),
          SimpleText(text: textb, color: AppColors.BLACK, size: 8.sp),



        ],
      ),
    );
  }
}