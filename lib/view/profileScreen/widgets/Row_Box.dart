import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/AppColors.dart';
import '../../../Widgets/Texts.dart';

class Profile_Row_Box extends StatelessWidget {
  const Profile_Row_Box({
    super.key,
    required this.w,
    required this.h,
    required this.text,
    required this.colora,
    required this.colorb,
    required this.ontap,
    required this.check,

  });

  final double w;
  final double h;
  final String text;
  final Color colora;
  final Color colorb;
  final VoidCallback ontap;
  final bool check;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(w/50),
      child: GestureDetector(
        onTap: ontap,
        child: Container(

          padding: EdgeInsets.all(w/220),
          width:check==true? w/4:w/6,
          height: h/14,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(check==true?20:5),
            color: colora,
          ),
          child: SimpleText(text: text,color:colorb,size: 7.sp,align: TextAlign.center),alignment: Alignment.center,
        ),
      ),
    );
  }
}
