import 'package:bhaile/widgets/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/AppColors.dart';
import '../../../widgets/boldText.dart';
import '../widgets/Botton_Sheet.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: h / 80,
              ),
              Image.asset(
                'assets/logo.png',
                width: w / 2,
                height: h / 12,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: h / 100,
              ),
              BoldText(text: 'Bhaile', size: 16.sp),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: w / 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                  height: h / 20,
                ),
                TextButton(onPressed: (){
                  print("yes");

                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomBottomSheet();
                    },
                  );

                }, child: BoldText(text: "Select Location",size: 10.sp,color: AppColors.PRIMARY_DARK,),),
                SizedBox(
                  height: h / 80,
                ),
                TextButton(onPressed: (){}, child:       BoldText(
                  text: 'Listings',
                  size: 10.sp,
                  color: AppColors.PRIMARY_DARK,
                ),),

                SizedBox(
                  height: h / 80,
                ),
                TextButton(onPressed: (){}, child:   BoldText(
                  text: 'Services',
                  size: 10.sp,
                  color: AppColors.PRIMARY_DARK,
                ),),


                SizedBox(
                  height: h / 80,
                ),
                TextButton(onPressed: (){}, child:    BoldText(
                  text: 'Agents',
                  size: 10.sp,
                  color: AppColors.PRIMARY_DARK,
                ),),

                SizedBox(
                  height: h / 80,
                ),
                TextButton(onPressed: (){}, child:    BoldText(
                  text: 'Land Lords',
                  size: 10.sp,
                  color: AppColors.PRIMARY_DARK,
                ),),

                SizedBox(
                  height: h / 80,
                ),
                TextButton(onPressed: (){}, child:    BoldText(
                  text: 'Reviews',
                  size: 10.sp,
                  color: AppColors.PRIMARY_DARK,
                ),),

                SizedBox(
                  height: h / 80,
                ),
                TextButton(onPressed: (){}, child:   BoldText(
                  text: 'Messages',
                  size: 10.sp,
                  color: AppColors.PRIMARY_DARK,
                ),),

                SizedBox(
                  height: h / 80,
                ),
                TextButton(onPressed: (){}, child:   BoldText(
                  text: 'Notifications',
                  size: 10.sp,
                  color: AppColors.PRIMARY_DARK,
                ),),

                SizedBox(
                  height: h / 80,
                ),
                TextButton(onPressed: (){}, child:   BoldText(
                  text: 'Offers',
                  size: 10.sp,
                  color: AppColors.PRIMARY_DARK,
                ),),

              ],
            ),
          )
        ],
      ),
    );
  }
}
