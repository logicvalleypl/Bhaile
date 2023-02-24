import 'package:flutter/widgets.dart';

import '../Constants/AppColors.dart';

class CircularContainer extends StatelessWidget {
  CircularContainer({
    super.key,
    this.no = false,
    required this.ontap,
    required this.heightDivididedBy,
    required this.child,
    this.fontSize = 12,
    required this.widthDividedBy,
    this.color = AppColors.WHITE,
  });
  bool no;
  Color color;
  Widget child;
  double fontSize;
  double widthDividedBy;
  double heightDivididedBy;
  VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Container(
        alignment: Alignment.center,
        width: w / widthDividedBy,
        height: h / heightDivididedBy,
        child: child,
        decoration: BoxDecoration(
            color:
                //  no ? AppColors.WHITE :
                color,
            borderRadius: BorderRadius.circular(25)));
  }
}
