import 'package:bhaile/constants/AppColors.dart';
import 'package:bhaile/widgets/boldText.dart';
import 'package:bhaile/widgets/circularContainer.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SecondListView extends StatelessWidget {
  const SecondListView({
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
            height: h / 3.2,
            width: w / 1.4,
            decoration: BoxDecoration(
              color: AppColors.WHITE.withOpacity(0.9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(w / 20),
                bottomLeft: Radius.circular(w / 20),
                topRight: Radius.circular(w / 20),
                bottomRight: Radius.circular(
                  w / 20,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(w / 40),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: w / 40, top: h / 60, bottom: h / 60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // CircleAvatar(
                        //   backgroundColor: AppColors.WHITE,
                        //   child: Icon(
                        //     Icons.favorite,
                        //     color: AppColors.PRIMARY_DARK,
                        //   ),
                        //   radius: 20,
                        // ),
                        CircularContainer(
                          ontap: () {},
                          color: AppColors.PRIMARY_DARK,
                          widthDividedBy: 4,
                          heightDivididedBy: 28,
                          child: NormalText(
                              color: AppColors.WHITE,
                              text: 'Buy Now',
                              size: 8.sp),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/OnBoarding/Signupa.png',
                            ),
                            fit: BoxFit.fitHeight),
                        color: AppColors.BLACK,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(w / 20),
                            bottomLeft: Radius.circular(w / 20),
                            topRight: Radius.circular(w / 20),
                            bottomRight: Radius.circular(w / 20))),
                    height: h / 3.2,
                    width: w / 2.8,
                  ),
                  SizedBox(
                    width: w / 50,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                alignment: Alignment.topLeft,
                                width: w / 3,
                                child: BoldText(
                                    align: TextAlign.start,
                                    text: 'Sky Dandelions Apartment',
                                    color: AppColors.PRIMARY_DARK,
                                    size: 8.sp)),
                            SizedBox(
                              height: h / 100,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: w / 35,
                                ),
                                SizedBox(
                                  width: w / 100,
                                ),
                                BoldText(
                                  text: '4.5',
                                  size: 8.sp,
                                  color: AppColors.PRIMARY_DARK,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: h / 100,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_city,
                                  size: w / 35,
                                ),
                                SizedBox(
                                  width: w / 100,
                                ),
                                BoldText(
                                  text: 'Dubai UAE',
                                  size: 8.sp,
                                  color: AppColors.PRIMARY_DARK,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                BoldText(
                                  text: '\$ 290',
                                  size: 10.sp,
                                  color: AppColors.PRIMARY_DARK,
                                  align: TextAlign.start,
                                ),
                                BoldText(
                                  color: AppColors.PRIMARY_DARK,
                                  text: '/month',
                                  size: 6.sp,
                                  align: TextAlign.start,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: h / 50,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: w / 200,
                  ),
                ],
              ),
            ),
          ),
        ),
        itemCount: 10,
      ),
    );
  }
}
