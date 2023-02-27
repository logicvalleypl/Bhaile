import 'package:bhaile/Constants/AppColors.dart';
import 'package:bhaile/view/Welcome_Screens/Location_one.dart';
import 'package:bhaile/widgets/boldText.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/circularButton.dart';

class CustomBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Container(
      height: h/2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: h/25,),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                BoldText(text:"Select Location" ,size: 12.sp,color: AppColors.PRIMARY_DARK,),
                SizedBox(width: w/4,),
                CircularButton(ontap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Location_one(),));
                }, heightDivididedBy:20, text: "Add Location", widthDividedBy:4,radius: 60,color: AppColors.PRIMARY,fontSize: 5.sp,)
              ],
            ),
          ),


          Padding(
            padding: EdgeInsets.all(w/60),
            child: Container(
              width: w/1.1,
              height: h/10,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(w/20),
                ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Icon(
                      Icons.location_on,
                      size: 30,
                    ),
                  ),
                ],
              ),
              ),
          ),
          Padding(
            padding: EdgeInsets.all(w/60),
            child: Container(
              width: w/1.1,
              height: h/10,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(w/20),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Icon(
                      Icons.location_on,
                      size: 30,
                    ),
                  ),

                ],
              ),
            ),
          ),


        SizedBox(height: h/22,),
          Align(
              alignment: Alignment(0,0),
              child: CircularButton(text: "Chose Location",ontap: (){},heightDivididedBy: 13,widthDividedBy: 1.4,color: AppColors.PRIMARY,fontSize: 8.sp,radius: 10,)),
        ],
      ),
    );
  }
}