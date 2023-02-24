import 'package:bhaile/constants/AppColors.dart';
import 'package:bhaile/widgets/boldText.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CircularButton extends StatelessWidget {
  CircularButton({
    super.key,
    this.no = false,
    required this.ontap,
    required this.heightDivididedBy,
    this.radius = 15,
    required this.text,
    this.color = AppColors.PRIMARY,
    this.fontSize = 12,
    required this.widthDividedBy,
  });
  bool no;
  double radius;

  String text;
  Color color;
  double fontSize;
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
          child: BoldText(
            color: no ? AppColors.PRIMARY : AppColors.WHITE,
            text: text,
            size: fontSize.sp,
          ),
          decoration: BoxDecoration(
              // border: Border.all(color: AppColors.PRIMARY),
              color: color,
              borderRadius: BorderRadius.circular(radius))),
    );
  }
}

// class CircularIcon extends StatelessWidget {
//   CircularIcon({
//     super.key,
//     required this.ontap,
//     required this.heightDivididedBy,
//     required this.icon,
//     required this.widthDividedBy,
//   });

//   String icon;
//   double widthDividedBy;
//   double heightDivididedBy;
//   VoidCallback ontap;
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;

//     return GestureDetector(
//       onTap: ontap,
//       child: Container(
//           alignment: Alignment.center,
//           width: width / widthDividedBy,
//           height: height / heightDivididedBy,
//           child: Image.asset(icon),
//           decoration: BoxDecoration(boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 1,
//               blurRadius: 2,
//               offset: Offset(0, 3), // changes position of shadow
//             ),
//           ], color: AppColors.WHITE, borderRadius: BorderRadius.circular(25))),
//     );
//   }
// }
