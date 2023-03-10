import 'package:bhaile/constants/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Widgets/Texts.dart';

class FilterationRow extends StatelessWidget {
  FilterationRow({
    super.key,
    required this.text,
    required this.colora,
    required this.colorb,
    required this.ontap,
    this.widthDividedBy = 4,
    required this.check,
  });

  final String text;
  final Color colora;
  final Color colorb;
  double widthDividedBy;
  final VoidCallback ontap;
  final bool check;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: w / 50, bottom: w / 50),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          padding: EdgeInsets.all(w / 220),
          width: w / widthDividedBy,
          height: h / 14,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(check == true ? 20 : 5),
            color: check ? colorb : colora,
          ),
          child: SimpleText(
              text: text,
              color: AppColors.GREY,
              size: 7.sp,
              align: TextAlign.center),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
