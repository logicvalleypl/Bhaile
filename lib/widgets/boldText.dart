import 'package:bhaile/Constants/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BoldText extends StatelessWidget {
  BoldText({
    super.key,
    this.color = AppColors.PRIMARY,
    required this.text,
    required this.size,
    this.align = TextAlign.center,
  });
  TextAlign align;

  double size;
  Color color;
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: size.sp, color: color),
    );
  }
}

class GradientText extends StatelessWidget {
  GradientText({
    super.key,
    required this.text,
    required this.size,
  });

  double size;

  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.PRIMARY,
        // foreground: Paint()
        //   ..shader = LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: <Color>[AppColors.PRIMARY, Colors.black],
        //   ).createShader(Rect.fromLTWH(0.0, 0.0, 25.0, 75.0)),
        fontWeight: FontWeight.bold,
        fontSize: size.sp,
      ),
    );
  }
}

class NormalText extends StatelessWidget {
  NormalText({
    super.key,
    this.color = AppColors.PRIMARY_DARK,
    required this.text,
    required this.size,
  });

  double size;
  Color color;
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.normal, fontSize: size.sp, color: color),
    );
  }
}
