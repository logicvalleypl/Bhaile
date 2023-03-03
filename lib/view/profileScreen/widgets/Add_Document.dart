import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/AppColors.dart';
import '../../../Widgets/Texts.dart';

class Add_Document extends StatelessWidget {
  const Add_Document({
    super.key,
    required this.w,
    required this.h,
    required this.text,
    required this.icon,
  });

  final double w;
  final double h;
  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Bold_Text(text: text, color: AppColors.PRIMARY_DARK, size: 10.sp),
        SizedBox(width: w/20,),
        GestureDetector(
          onTap: (){},
          child: Container(
            width: w/2,
            height: h/12,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(w/20),

            ),


            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                SizedBox(width: w/20,),
                SimpleText(text: "Add Document", color: AppColors.PRIMARY_DARK, size: 8.sp),
                SizedBox(width: w/20,),
                  icon,


              ],
            ),

          ),
        ),
      ],);
  }
}