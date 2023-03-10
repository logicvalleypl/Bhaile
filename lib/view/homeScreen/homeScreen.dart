import 'package:bhaile/Constants/AppColors.dart';
import 'package:bhaile/view/homeScreen/drawers/mainDrawer.dart';
import 'package:bhaile/view/homeScreen/widgets/estateWidget.dart';
import 'package:bhaile/view/homeScreen/widgets/firstListview.dart';
import 'package:bhaile/view/homeScreen/widgets/happyCustomers.dart';
import 'package:bhaile/view/homeScreen/widgets/secondListview.dart';
import 'package:bhaile/view/homeScreen/widgets/texthorizontal.dart';
import 'package:bhaile/view/homeScreen/widgets/threeButtons.dart';
import 'package:bhaile/view/homeScreen/widgets/topOne.dart';
import 'package:bhaile/view/homeScreen/widgets/whatwedo.dart';
import 'package:bhaile/widgets/boldText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/homeScreenController.dart';
import 'drawers/optionalDrawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, this.notLoggedIn = false});

  bool notLoggedIn;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var width = w;
    var height = h;
    var ctrlll = context.read<HomeScreenController>();

    return SafeArea(
        child: Scaffold(
            drawer: notLoggedIn
                ? OptionalDrawer(h: h, w: w)
                : MainDrawer(h: h, w: w),
            backgroundColor: AppColors.WHITE.withOpacity(0.95),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TopOne(w: w, h: h),
                  SizedBox(
                    height: h / 60,
                  ),
                  if (notLoggedIn)
                    Column(
                      children: [
                        ThreeButtons(w: w),
                        SizedBox(
                          height: h / 30,
                        ),
                      ],
                    ),
                  Padding(
                    padding: EdgeInsets.only(left: w / 20, right: w / 20),
                    child: Row(
                      children: [
                        BoldText(
                          text: 'How it works',
                          color: AppColors.PRIMARY_DARK,
                          size: 14.sp,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h / 60,
                  ),
                  FirstListView(h: h, w: w),
                  SizedBox(
                    height: h / 30,
                  ),
                  TextHorzWidget(w: w, text: 'Membership Plans'),
                  SizedBox(
                    height: h / 80,
                  ),
                  SecondListView(h: h, w: w),
                  SizedBox(
                    height: h / 80,
                  ),
                  TextHorzWidget(
                    w: w,
                    text: 'What we do',
                  ),
                  SizedBox(
                    height: h / 80,
                  ),
                  WhatWeDoWidget(h: h, w: w),
                  SizedBox(
                    height: h / 80,
                  ),
                  TextHorzWidget(w: w, text: 'Happy Customers'),
                  SizedBox(
                    height: h / 80,
                  ),
                  HappyCustomers(h: h, w: w),
                  SizedBox(
                    height: height / 30,
                  ),
                  Padding(
                    padding: EdgeInsets.all(w / 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            BoldText(
                                text: 'Explore Nearby Estates',
                                color: AppColors.PRIMARY_DARK,
                                size: 20),
                          ],
                        ),
                        SizedBox(
                          height: height / 30,
                        ),
                        Consumer<HomeScreenController>(
                            builder: (context, c, d) {
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: height / 3,
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            shrinkWrap: true,
                            itemCount: c.nearByEstates.length,
                            physics: const ScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return EstateWidget(
                                model: c.nearByEstates[index],
                                index: index,
                                like: () {
                                  ctrlll.likeOrDisLike(false, index);
                                },
                                disLike: () {
                                  ctrlll.likeOrDisLike(true, index);
                                },
                              );
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
