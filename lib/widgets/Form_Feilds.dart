import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Input_Feild extends StatelessWidget {
  final text;
  final Icon icon;
  const Input_Feild({
    required this.text,
    this.isPassword = false,
    required this.validate,
    required this.ctrl,
    required this.icon,
    super.key,
  });
  final TextEditingController ctrl;
  final bool isPassword;
  final String? Function(String? a) validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      obscureText: isPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[300],
        hintText: text,
        prefixIcon: icon,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12)),
        contentPadding:
            EdgeInsets.symmetric(vertical: 21.sp, horizontal: 10.sp),
      ),
    );
  }
}

class Small_feilds extends StatelessWidget {
  const Small_feilds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.sp,
      height: 55.sp,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[300],
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12)),
          contentPadding:
              EdgeInsets.symmetric(vertical: 23.sp, horizontal: 10.sp),
        ),
      ),
    );
  }
}
