import 'package:bhaile/constants/AppColors.dart';
import 'package:bhaile/view/profileScreen/Edit_Profile.dart';
import 'package:bhaile/view/profileScreen/widgets/Profile_Box.dart';
import 'package:bhaile/view/profileScreen/widgets/Row_Box.dart';
import 'package:bhaile/widgets/Texts.dart';
import 'package:bhaile/widgets/boldText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/Profile_Controller.dart';
import '../../controllers/homeScreenController.dart';
import '../../widgets/Buttons.dart';
import '../homeScreen/widgets/Home_Listing.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var ctrl = context.read<Profile_Controller>();
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: h / 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: w / 2.5,
                  ),
                  Bold_Text(
                    text: "Profile",
                    color: AppColors.PRIMARY_DARK,
                    size: 16.sp,
                  ),
                  SizedBox(
                    width: w / 4,
                  ),
                  Icon_Buttonn(w: w, h: h,icon: Icon(Icons.settings),ontap: (){Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Edit_Profile()));}),
                ],
              ),
              SizedBox(
                height: h / 25,
              ),
              Image.asset("assets/Home/sample.png"),
              SizedBox(
                height: h / 60,
              ),
              SimpleText(
                  text: "Mathew Adam", color: AppColors.BLACK, size: 12.sp),
              SimpleText(
                  text: "mathey@gmail.com", color: AppColors.BLACK, size: 8.sp),
              SizedBox(
                height: h / 40,
              ),
              Padding(
                padding: EdgeInsets.all(w / 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Profile_Box(
                        w: w, h: h, texta: 30.toString(), textb: "Listings"),
                    Profile_Box(
                        w: w, h: h, texta: 12.toString(), textb: "Sold"),
                    Profile_Box(
                        w: w, h: h, texta: 28.toString(), textb: "Reviews"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(w / 30),
                child: Container(
                  width: w / 1.1,
                  height: h / 14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.grey[200],
                  ),
                  child: Consumer<Profile_Controller>(
                    builder: (co, ct, ch) => ct.check == 0?  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Profile_Row_Box(
                          w: w,
                          h: h,
                          text: "transactions",
                          colora: AppColors.WHITE,
                          colorb: AppColors.PRIMARY_DARK,
                          ontap: () {
                            ctrl.changeCheck(0);
                          },
                          check: true,
                        ),
                        Profile_Row_Box(
                          w: w,
                          h: h,
                          text: "Listings",
                          colora: Colors.grey[200]!,
                          colorb: AppColors.GREY,
                          ontap: () {
                            ctrl.changeCheck(1);
                          },
                          check: true,
                        ),
                        Profile_Row_Box(
                          w: w,
                          h: h,
                          text: "Sold",
                          colora: Colors.grey[200]!,
                          colorb: AppColors.GREY,
                          ontap: () {
                            ctrl.changeCheck(2);
                          },
                          check: true,
                        ),
                      ],
                    ):ct.check == 1?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Profile_Row_Box(
                          w: w,
                          h: h,
                          text: "transactions",
                          colora: Colors.grey[200]!,
                          colorb: AppColors.GREY,
                          ontap: () {
                            ctrl.changeCheck(0);
                          },
                          check: true,
                        ),
                        Profile_Row_Box(
                          w: w,
                          h: h,
                          text: "Listings",
                          colora: AppColors.WHITE,
                          colorb: AppColors.PRIMARY_DARK,
                          ontap: () {
                            ctrl.changeCheck(1);
                          },
                          check: true,
                        ),
                        Profile_Row_Box(
                          w: w,
                          h: h,
                          text: "Sold",
                          colora: Colors.grey[200]!,
                          colorb: AppColors.GREY,
                          ontap: () {
                            ctrl.changeCheck(2);
                          },
                          check: true,
                        ),
                      ],
                    ):Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Profile_Row_Box(
                          w: w,
                          h: h,
                          text: "transactions",
                          colora: Colors.grey[200]!,
                          colorb: AppColors.GREY,
                          ontap: () {
                            ctrl.changeCheck(0);
                          },
                          check: true,
                        ),
                        Profile_Row_Box(
                          w: w,
                          h: h,
                          text: "Listings",
                          colora: Colors.grey[200]!,
                          colorb: AppColors.GREY,
                          ontap: () {
                            ctrl.changeCheck(1);
                          },
                          check: true,
                        ),
                        Profile_Row_Box(
                          w: w,
                          h: h,
                          text: "Sold",
                          colora: AppColors.WHITE,
                          colorb: AppColors.PRIMARY_DARK,
                          ontap: () {
                            ctrl.changeCheck(2);
                          },
                          check: true,
                        ),
                      ],
                    ),
                  )

                ),
              ),
              Consumer<Profile_Controller>(
                  builder: (co, ct, ch) => ct.check == 0
                      ? Padding(
                          padding: EdgeInsets.all(w / 20),
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment(-w / 400, 0),
                                  child: Bold_Text(
                                      text: "2 transactions",
                                      color: AppColors.PRIMARY_DARK,
                                      size: 14.sp)),
                              SizedBox(
                                height: h / 20,
                              ),
                              Consumer<HomeScreenController>(
                                  builder: (context, c, d) {
                                return GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: h / 3.4,
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                                  shrinkWrap: true,
                                  itemCount: c.Data_List.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return
                                        // Column(
                                        // children: [
                                        Home_Listing(
                                      model: c.Data_List[index],
                                      index: index,

                                      // width: width,
                                      // height: height,
                                      // name:  Data_List[index].name,
                                      // location: Data_List[index].location,
                                      // price: Data_List[index].price,
                                      // rating: Data_List[index].rating,
                                      // src: Data_List[index].src,

                                      //   ),
                                      // ],
                                    );
                                  },
                                );
                              }),
                            ],
                          ),
                        )
                      : ct.check == 1
                          ? Padding(
                              padding: EdgeInsets.all(w / 20),
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment(-w / 400, 0),
                                      child: Bold_Text(
                                          text: "2 transactions",
                                          color: AppColors.PRIMARY_DARK,
                                          size: 14.sp)),
                                  SizedBox(
                                    height: h / 20,
                                  ),
                                  Consumer<HomeScreenController>(
                                      builder: (context, c, d) {
                                    return GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisExtent: h / 3.4,
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                      ),
                                      shrinkWrap: true,
                                      itemCount: c.Data_List.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return
                                            // Column(
                                            // children: [
                                            Home_Listing(
                                          model: c.Data_List[index],
                                          index: index,

                                        );
                                      },
                                    );
                                  }),
                                ],
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.all(w / 20),
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment(-w / 400, 0),
                                      child: Bold_Text(
                                          text: "2 transactions",
                                          color: AppColors.PRIMARY_DARK,
                                          size: 14.sp)),
                                  SizedBox(
                                    height: h / 20,
                                  ),
                                  Consumer<HomeScreenController>(
                                      builder: (context, c, d) {
                                    return GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisExtent: h / 3.4,
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                      ),
                                      shrinkWrap: true,
                                      itemCount: c.Data_List.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return
                                            // Column(
                                            // children: [
                                            Home_Listing(
                                          model: c.Data_List[index],
                                          index: index,

                                        );
                                      },
                                    );
                                  }),
                                ],
                              ),
                            )),
            ],
          ),
        ),
      ),
    ));
  }
}


