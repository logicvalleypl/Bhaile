
import 'package:bhaile/Widgets/Texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Sheet_Location extends StatelessWidget {
  const Sheet_Location({
    super.key,
    required this.w,
    required this.h,
    required this.location,
    required this.color,
    required this.ontap,
    required this.colora,
  });

  final double w;
  final double h;
  final String location;
  final Color color;
  final VoidCallback ontap;
  final Color colora;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(w/60),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          width: w/1.1,
          height: h/10,
          decoration: BoxDecoration(
            color:color,
            borderRadius: BorderRadius.circular(w/20),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Icon(
                  Icons.location_on,
                  size: 30,
                  color: colora,
                ),
              ),
              SimpleText(text: location, color: colora, size: 8.sp),
            ],
          ),
        ),
      ),
    );
  }
}