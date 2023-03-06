import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Small_Feilds extends StatelessWidget {
  const Small_Feilds({
    super.key,
    required this.width,
    required this.height,
    required this.validate,
    required this.text,
    required this.ctrl,
    required this.icon,
  });

  final double width;
  final double height;
  final String? Function(String? a) validate;
  final String text;
  final TextEditingController ctrl;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width / 2.3,
      height: height / 2.3,
      child: TextFormField(
        validator: validate,
        decoration: InputDecoration(

          filled: true,
          fillColor: Colors.grey[300],
          prefixIcon: icon,
          hintText: text,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(width/30)),
          contentPadding:  EdgeInsets.symmetric(vertical: 21.sp, horizontal: 10.sp),
        ),
      ),
    );
  }
}