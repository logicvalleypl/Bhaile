import 'package:bhaile/constants/AppColors.dart';
import 'package:bhaile/widgets/boldText.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FirstListView extends StatelessWidget {
  const FirstListView({
    super.key,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h / 3.7,
      child: ListView.builder(
        padding: EdgeInsets.only(left: w / 20),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (c, i) => Padding(
          padding: EdgeInsets.only(right: w / 40),
          child: Container(
            padding: EdgeInsets.only(left: w / 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoldText(
                  text: 'Halloween Sale',
                  size: 14.sp,
                  color: AppColors.WHITE,
                ),
                SizedBox(
                  height: h / 30,
                ),
                NormalText(
                    color: AppColors.WHITE,
                    text: 'All discount upto 60%',
                    size: 10.sp)
              ],
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/OnBoarding/Signupa.png',
                    ),
                    fit: BoxFit.cover),
                color: AppColors.BLACK,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(w / 20),
                    topRight: Radius.circular(w / 20),
                    bottomRight: Radius.circular(w / 20))),
            height: h / 3.2,
            width: w / 1.4,
          ),
        ),
        itemCount: 10,
      ),
    );
  }
}
