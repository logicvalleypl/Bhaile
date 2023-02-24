import 'package:bhaile/Constants/AppColors.dart';
import 'package:bhaile/widgets/boldText.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HappyCustomers extends StatelessWidget {
  const HappyCustomers({
    super.key,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h / 12,
      // padding: EdgeInsets.only(left: w / 20, right: w / 20),
      child: ListView.builder(
        padding: EdgeInsets.only(left: w / 20, right: w / 20),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (c, i) => Padding(
          padding: EdgeInsets.only(right: w / 20),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.GREY,
                backgroundImage: AssetImage('assets/preferable/imga.png'),
                radius: w / 20,
              ),
              SizedBox(
                height: h / 150,
              ),
              NormalText(
                  color: AppColors.PRIMARY_DARK, text: 'Apartment', size: 7.sp),
              // SizedBox(
              //   width: w / 20,
              // ),
            ],
          ),
        ),
        itemCount: 10,
      ),
    );
  }
}
