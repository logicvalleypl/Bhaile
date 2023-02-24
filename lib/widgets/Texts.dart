import 'package:bhaile/constants/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// class BoldText extends StatelessWidget {
//   const BoldText({
//     super.key,
//     required this.text,
//     required this.color,
//     required this.size,
//   });

//   final String text;
//   final Color color;
//   final double size;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         fontSize: size,
//         color: color,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }
// }

class SimpleText extends StatelessWidget {
  const SimpleText(
      {super.key,
      required this.text,
      required this.color,
      required this.size,
      this.align = TextAlign.start});

  final String text;
  final Color color;
  final double size;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: size.sp,
        color: color,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

class Rich_Text extends StatelessWidget {
  final String texta;
  final String textb;
  final double size;

  const Rich_Text({
    required this.texta,
    required this.textb,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: size.sp,
          color: Colors.black,
          wordSpacing: 2,
        ),
        children: <TextSpan>[
          TextSpan(text: texta),
          TextSpan(
              text: textb,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.PRIMARY_DARK)),
        ],
      ),
    );
  }
}
