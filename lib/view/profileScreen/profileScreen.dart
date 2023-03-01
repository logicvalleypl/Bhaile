import 'package:bhaile/constants/AppColors.dart';
import 'package:bhaile/view/profileScreen/widgets/Profile_Box.dart';
import 'package:bhaile/widgets/Texts.dart';
import 'package:bhaile/widgets/boldText.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery
        .of(context)
        .size
        .width;
    var h = MediaQuery
        .of(context)
        .size
        .height;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

            SizedBox(
              height: h/28,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: w/2.5,),
                Text(
                  "Profile",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColors.PRIMARY_DARK,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],

            ),

              SizedBox(height: h/25,),
              Image.asset("assets/Home/sample.png"),
              SizedBox(height: h/60,),
              SimpleText(text: "Mathew Adam", color: AppColors.BLACK, size: 12.sp),
              SimpleText(text: "mathey@gmail.com", color: AppColors.BLACK, size: 8.sp),

              SizedBox(height: h/40,),
              Padding(
                padding: EdgeInsets.all(w/32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                 
                    Profile_Box(w: w, h: h,texta: 30.toString(),textb:"Listings"),
                    Profile_Box(w: w, h: h,texta: 12.toString(),textb:"Sold"),
                    Profile_Box(w: w, h: h,texta: 28.toString(),textb:"Reviews"),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    ));
  }
}


