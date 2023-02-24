import 'package:bhaile/view/homeScreen/widgets/firstRow.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TopOne extends StatelessWidget {
  const TopOne({
    super.key,
    required this.w,
    required this.h,
  });

  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h / 2.2,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          alignment: Alignment.topLeft,
          image: AssetImage('assets/circle.png'),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: h / 100,
          ),
          FirstRow(w: w),
          // SizedBox(
          //   height: h / 20,
          // ),
          // Padding(
          //   padding: EdgeInsets.only(left: w / 20),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           NormalText(text: 'Hey,', size: 18.sp),
          //           BoldText(
          //             text: 'Jonathan',
          //             size: 20.sp,
          //             color: AppColors.PRIMARY_DARK,
          //           ),
          //         ],
          //       ),
          //       NormalText(text: 'Let\'s start exploring,', size: 18.sp),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: h / 40,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: h / 3.2,
              aspectRatio: 0.8,
              viewportFraction: 0.5,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 4),
              autoPlayAnimationDuration: Duration(milliseconds: 1200),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
            items: [
              'assets/preferable/imga.png',
              'assets/preferable/imgb.png',
              'assets/preferable/imgc.png',
              'assets/preferable/imgd.png',
              'assets/preferable/imge.png',
              'assets/preferable/imgf.png',
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    decoration: BoxDecoration(
                      // color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(i), fit: BoxFit.cover),
                    ),
                  );
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
