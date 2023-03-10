import 'package:bhaile/view/editProfileScreen/editTenantProfileScreen.dart/editTenantProfileScreen.dart';
import 'package:bhaile/view/homeScreen/widgets/estateWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Constants/AppColors.dart';
import '../../../controllers/profileControllers/profileController.dart';
import '../../../widgets/boldText.dart';
import '../widgets/filterationRow.dart';
import '../widgets/profileButton.dart';
import '../widgets/profileDetailsTile.dart';
import '../widgets/profilePictureWidget.dart';

class TenantProfileScreen extends StatelessWidget {
  const TenantProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var ctrl = context.read<ProfileController>();

    return Consumer<ProfileController>(builder: (context, cc, child) {
      return cc.tenantModel == null
          ? Container()
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h / 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: w / 10,
                      ),
                      BoldText(
                        text: "Profile",
                        size: 16,
                        color: AppColors.PRIMARY_DARK,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: w / 20),
                        child: Container(
                          width: w / 8,
                          height: h / 16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            color: Colors.grey[200],
                          ),
                          child: IconButton(
                              icon: Icon(Icons.settings),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EditTenantProfileScreen()));
                              },
                              color: AppColors.PRIMARY_DARK),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h / 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProfilePictureWidget(
                        fName: cc.tenantModel!.firstName,
                        lName: cc.tenantModel!.lastName,
                        email: cc.tenantModel!.email,
                        image: cc.tenantModel!.photo,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h / 30,
                  ),
                  Padding(
                    padding: EdgeInsets.all(w / 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProfileButton(
                            texta: 30.toString(), textb: "Recommended"),
                        ProfileButton(
                            texta: 12.toString(), textb: "Favourites"),
                        ProfileButton(
                            texta: 28.toString(), textb: "Hot Listing"),
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
                            color: AppColors.GREYLIGHT),
                        child: Consumer<ProfileController>(
                            builder: (context, ctrll, ch) =>
                                // ctrll.check == 0
                                // ?
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    FilterationRow(
                                      text: "Personal Info",
                                      colora: AppColors.GREYLIGHT,
                                      colorb: AppColors.WHITE,
                                      ontap: () {
                                        ctrl.changeFilteredIndex(0);
                                      },
                                      check: cc.filterationIndex == 0
                                          ? true
                                          : false,
                                    ),
                                    FilterationRow(
                                      text: "Favourite Listing",
                                      colora: AppColors.GREYLIGHT,
                                      colorb: AppColors.WHITE,
                                      ontap: () {
                                        ctrl.changeFilteredIndex(1);
                                      },
                                      check: cc.filterationIndex == 1
                                          ? true
                                          : false,
                                    ),
                                  ],
                                ))),
                  ),
                  Selector<ProfileController, int>(
                      selector: (p0, p1) => p1.filterationIndex,
                      builder: (context, index, child) {
                        return index == 0
                            ? Padding(
                                padding: EdgeInsets.only(
                                    left: w / 20, right: w / 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ProfileDetailsTile(
                                      data: cc.tenantModel!.firstName +
                                          " " +
                                          cc.tenantModel!.lastName,
                                      hint: "Name",
                                    ),
                                    SizedBox(
                                      height: h / 200,
                                    ),
                                    ProfileDetailsTile(
                                      data: cc.tenantModel!.email,
                                      hint: "Email",
                                    ),
                                    SizedBox(
                                      height: h / 200,
                                    ),
                                    ProfileDetailsTile(
                                      data: cc.tenantModel!.address ?? "N/A",
                                      hint: "Address",
                                    ),
                                    SizedBox(
                                      height: h / 200,
                                    ),
                                    ProfileDetailsTile(
                                      data: cc.tenantModel!.zipCode ?? "N/A",
                                      hint: "Zip Code",
                                    ),
                                    SizedBox(
                                      height: h / 200,
                                    ),
                                  ],
                                ),
                              )
                            : Consumer<ProfileController>(
                                builder: (context, c, d) {
                                return GridView.builder(
                                  physics: ScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: h / 3,
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                                  shrinkWrap: true,
                                  itemCount: c.tenanteListings.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return EstateWidget(
                                      model: c.tenanteListings[index],
                                      index: index,
                                      like: () {},
                                      disLike: () {},
                                    );
                                  },
                                );
                              });
                      })
                ],
              ),
            );
    });
  }
}
