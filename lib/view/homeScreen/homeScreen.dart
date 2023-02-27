import 'package:bhaile/Constants/AppColors.dart';
import 'package:bhaile/view/homeScreen/drawers/mainDrawer.dart';
import 'package:bhaile/view/homeScreen/widgets/Home_Listing.dart';
import 'package:bhaile/view/homeScreen/widgets/firstListview.dart';
import 'package:bhaile/view/homeScreen/widgets/happyCustomers.dart';
import 'package:bhaile/view/homeScreen/widgets/secondListview.dart';
import 'package:bhaile/view/homeScreen/widgets/texthorizontal.dart';
import 'package:bhaile/view/homeScreen/widgets/threeButtons.dart';
import 'package:bhaile/view/homeScreen/widgets/topOne.dart';
import 'package:bhaile/view/homeScreen/widgets/whatwedo.dart';
import 'package:bhaile/widgets/boldText.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'drawers/optionalDrawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, this.notLoggedIn = false});
  bool notLoggedIn;
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var width= w;
    var height= h;

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
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BoldText(
                          text: 'How it works',
                          color: AppColors.PRIMARY_DARK,
                          size: 14.sp,
                        ),
                        // BoldText(
                        //   text: 'view all',
                        //   color: AppColors.PRIMARY_DARK,
                        //   size: 7.sp,
                        // )
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

                  Container(
                    width:w/5,
                    height: h/5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.elliptical(w / 30, w / 30)),
                    ),

                  ),

                  SizedBox(height: height / 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BoldText(text: 'Explore Nearby Estates',
                          color: AppColors.PRIMARY_DARK,
                          size: 20),
                    ],
                  ),

                  SizedBox(height: height / 30,),
                  Row(
                    children: [

                      Home_Listing(width: width,
                        height: height,
                        src: "assets/Home/homeba.png",
                        location: "Jakarta indonesia",
                        name: "Wings Tower",
                        price : 220,
                        rating: 4.9,
                      ),
                      SizedBox(width: width/30,),

                      Home_Listing(width: width,
                        height: height,
                        src: "assets/Home/homebb.png",
                        location: "Jakarta indonesia",
                        name: "Mil sper House",
                        price : 271,
                        rating: 4.8,
                      ),

                    ],
                  ),
                  SizedBox(height: height / 30,),
                  Row(
                    children: [

                      Home_Listing(width: width,
                        height: height,
                        src: "assets/Home/homeba.png",
                        location: "Jakarta indonesia",
                        name: "Wings Tower",
                        price : 220,
                        rating: 4.9,
                      ),
                      SizedBox(width: width/30,),

                      Home_Listing(width: width,
                        height: height,
                        src: "assets/Home/homebb.png",
                        location: "Jakarta indonesia",
                        name: "Mil sper House",
                        price : 271,
                        rating: 4.8,
                      ),

                    ],
                  ),

                  SizedBox(height: height / 30,),
                  Row(
                    children: [

                      Home_Listing(width: width,
                        height: height,
                        src: "assets/Home/homeba.png",
                        location: "Jakarta indonesia",
                        name: "Wings Tower",
                        price : 220,
                        rating: 4.9,
                      ),
                      SizedBox(width: width/30,),

                      Home_Listing(width: width,
                        height: height,
                        src: "assets/Home/homebb.png",
                        location: "Jakarta indonesia",
                        name: "Mil sper House",
                        price : 271,
                        rating: 4.8,
                      ),

                    ],
                  ),


                ],
              ),
            )));
  }
}
