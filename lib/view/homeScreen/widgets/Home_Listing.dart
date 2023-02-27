import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/AppColors.dart';
import '../../../Widgets/Texts.dart';
import '../../../widgets/boldText.dart';

class Home_Listing extends StatelessWidget {
  const Home_Listing({
    super.key,
    required this.width,
    required this.height,
    required this.name,
    required this.location,
    required this.price,
    required this.rating,
    required this.src,
  });

  final double width;
  final double height;
  final String name;
  final String location;
  final String src;
  final double rating;
  final double price;


  @override
  Widget build(BuildContext context) {
    return Container(

      width: width / 2.4,
      height: height / 3.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.grey[200],

      ),


      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(width / 60, width / 60, width / 60, 0),
            child: Container(
              width: width / 2.5,
              height: height / 5.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey[200],
                image: DecorationImage(
                  image: AssetImage(src),
                  fit: BoxFit.fill,
                ),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,


                children: [

                  Align(
                    alignment: Alignment(width / 400, 0),
                    child: Padding(
                      padding: EdgeInsets.all(width / 40),
                      child: Container(

                        width: width / 10,
                        height: height / 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(80)),
                          color: AppColors.PRIMARY,

                        ),
                        child: Icon(Icons.favorite, color: Colors.white,),
                      ),
                    ),),

                  Align(
                    alignment: Alignment(width / 400, 0),
                    child: Padding(
                      padding: EdgeInsets.all(width / 40),
                      child: Container(

                        width: width / 4,
                        height: height / 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: AppColors.PRIMARY_DARK,

                        ),
                        child: BoldText(
                            text: price.toString(), color: Colors.white, size: 14.sp),
                      ),
                    ),),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(width / 60),
            child: Container(
              width: width / 2.5,
              height: height / 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.grey[200],

              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  Align(
                      alignment: Alignment(-width / 500, 0),
                      child: BoldText(text: name,
                          color: AppColors.PRIMARY_DARK,
                          size: 10.sp)),

                  SizedBox(height: height / 200,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      SizedBox(width: width / 50,),
                      Image.asset("assets/Home/star.png"),
                      SizedBox(width: width / 60,),
                      BoldText(
                          text: rating.toString(), color: AppColors.PRIMARY_DARK, size: 6.sp),
                      SizedBox(width: width / 60,),
                      Icon(Icons.location_on_sharp, size: height / 60,),
                      SizedBox(width: width / 60,),
                      SimpleText(text: location,
                          color: Colors.grey[400]!,
                          size: 5.sp),



                    ],
                  ),
                ],
              ),
            ),
          ),


        ],
      ),


    );
  }
}