import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyTextField extends StatelessWidget {
  final String text;
  final Icon? icon;
  MyTextField({
    required this.text,
    this.isPassword = false,
    this.vPadding = 21,
    this.hPadding = 10,
    required this.validate,
    this.maxLines = 1,
    required this.ctrl,
    this.icon,
    super.key,
  });
  double vPadding, hPadding;

  final TextEditingController ctrl;
  final bool isPassword;
  final String? Function(String? a) validate;
  int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.left,
      validator: validate,
      maxLines: maxLines,
      controller: ctrl,
      obscureText: isPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[300],
        hintText: text,
        prefixIcon: icon == null ? null : icon,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12)),
        contentPadding: EdgeInsets.symmetric(
            vertical: vPadding.sp, horizontal: hPadding.sp),
      ),
    );
  }
}
