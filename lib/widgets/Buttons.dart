import 'package:bhaile/constants/AppColors.dart';
import 'package:bhaile/widgets/Texts.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SmallButton extends StatelessWidget {
  final bool check;
  final text;
  final VoidCallback ontap;

  const SmallButton(
      {super.key,
      required this.text,
      required this.check,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.grey[300],
        padding: check
            ? EdgeInsets.fromLTRB(15.sp, 6.sp, 15.sp, 6.sp)
            : EdgeInsets.all(10.sp),
        shape: check
            ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.sp))
            : CircleBorder(),
      ),
      child: SimpleText(text: text, size: 12.sp, color: Colors.black),
      onPressed: ontap,
    );
  }
}

class Icon_Button extends StatelessWidget {
  final text;
  final source;
  final VoidCallback ontap;

  const Icon_Button(
      {super.key,
      required this.source,
      required this.text,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.grey[300],
        padding: EdgeInsets.fromLTRB(16.sp, 10.sp, 16.sp, 10.sp),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.sp),
        ),
      ),
      child: Row(
        children: [
          Image.asset(source),
          SimpleText(text: text, size: 8.sp, color: Colors.black),
        ],
      ),
      onPressed: ontap,
    );
  }
}

class Text_Button extends StatelessWidget {
  Text_Button({super.key, required this.text, required this.ontap});

  final text;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text,
        style: TextStyle(color: AppColors.PRIMARY_DARK),
      ),
      onPressed: ontap,
    );
  }
}

// class MainButton extends StatelessWidget {
//   MainButton({
//     super.key,
//     required this.width,
//     required this.height,
//     required this.text,
//     required this.color,
//     required this.ontap,
//   });
//   final VoidCallback ontap;
//   final Color color;
//   final double width;
//   final double height;

//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: ontap,
//       child: Container(
//         width: width / 1.35,
//         height: height / 12,
//         child: Align(
//           alignment: Alignment.center,
//           child: SimpleText(text: text, color: Colors.white, size: 15.sp),
//         ),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.elliptical(10.sp, 10.sp)),
//           color: color,
//         ),
//       ),
//     );
//   }
// }

class Preferance_Button extends StatelessWidget {
  const Preferance_Button({
    super.key,
    required this.width,
    required this.height,
    required this.imgsource,
    required this.text,
    required this.color,
  });

  final Color color;
  final double width;
  final double height;
  final String imgsource;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width / 2.5,
      height: height / 4,
      child: GestureDetector(
        onTap: () {},
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height / 80,
              ),
              Image.asset(
                imgsource,
                width: width / 3,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: height / 80,
              ),
              SimpleText(text: text, color: Colors.black, size: 10.sp),
            ]),
      ),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.all(Radius.elliptical(width / 30, width / 30)),
        color: color,
      ),
    );
  }
}
