import 'package:bhaile/Constants/AppColors.dart';
import 'package:bhaile/controllers/homeScreenController.dart';
import 'package:bhaile/view/Welcome_Screens/Location_one.dart';
import 'package:bhaile/view/homeScreen/homeScreen.dart';
import 'package:bhaile/widgets/boldText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/circularButton.dart';
import 'Sheet_Location.dart';

class CustomBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var ctrl = context.read<HomeScreenController>();
    return Container(
      height: h / 2,
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
          SizedBox(
            height: h / 25,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                BoldText(
                  text: "Select Location",
                  size: 12.sp,
                  color: AppColors.PRIMARY_DARK,
                ),
                SizedBox(
                  width: w / 4,
                ),
                CircularButton(
                  ontap: () {
                    ctrl.changeScreenState(1);
                    print(ctrl.screenState);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Location_one(),
                        ));
                  },
                  heightDivididedBy: 20,
                  text: "Add Location",
                  widthDividedBy: 4,
                  radius: 60,
                  color: AppColors.PRIMARY,
                  fontSize: 5.sp,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(w / 30),
            child: SingleChildScrollView(
              child: Container(
                width: w,
                height: h / 4.2,
                color: Colors.grey[100],
                child: (Consumer<HomeScreenController>(
                  builder: (co, ct, ch) => ct.bottomSheet == 1
                      ? Column(
                          children: [
                            Sheet_Location(
                              w: w,
                              h: h,
                              location: "Logic Valley Awan Town Rawalpindi",
                              color: AppColors.PRIMARY_DARK,
                              ontap: () {
                                ctrl.funBottomSheet(1);
                              },
                              colora: AppColors.WHITE,
                            ),
                            Sheet_Location(
                              w: w,
                              h: h,
                              location: "Air University E9 Islamabad",
                              color: Colors.grey[200]!,
                              ontap: () {
                                ctrl.funBottomSheet(0);
                              },
                              colora: AppColors.PRIMARY_DARK,
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Sheet_Location(
                                w: w,
                                h: h,
                                location: "Logic Valley Awan Town Rawalpindi",
                                color: Colors.grey[200]!,
                                ontap: () {
                                  ctrl.funBottomSheet(1);
                                },
                                colora: AppColors.PRIMARY_DARK),
                            Sheet_Location(
                                w: w,
                                h: h,
                                location: "Air University E9 Islamabad",
                                color: AppColors.PRIMARY_DARK,
                                ontap: () {
                                  ctrl.funBottomSheet(0);
                                },
                                colora: AppColors.WHITE),
                          ],
                        ),
                )),
              ),
            ),
          ),
          Align(
              alignment: Alignment(0, 0),
              child: CircularButton(
                text: "Chose Location",
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                heightDivididedBy: 13,
                widthDividedBy: 1.4,
                color: AppColors.PRIMARY,
                fontSize: 8.sp,
                radius: 10,
              )),
        ],
      ),
    );
  }
}
