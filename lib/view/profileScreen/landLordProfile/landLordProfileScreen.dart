import 'package:bhaile/view/editProfileScreen/editLandLordProfileScreen.dart/editLandLordProfileScreen.dart';
import 'package:bhaile/widgets/circularButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Constants/AppColors.dart';
import '../../../controllers/profileControllers/profileController.dart';
import '../../../widgets/boldText.dart';
import '../../../widgets/myTextField.dart';
import '../../homeScreen/widgets/estateWidget.dart';
import '../widgets/filterationRow.dart';
import '../widgets/profileButton.dart';
import '../widgets/profileDetailsTile.dart';
import '../widgets/profilePictureWidget.dart';

class LandLordProfileScreen extends StatelessWidget {
  const LandLordProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var ctrl = context.read<ProfileController>();

    return Consumer<ProfileController>(builder: (context, cc, child) {
      return cc.landLordModel == null
          ? Container()
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                                            EditLandLordProfileScreen()));
                              },
                              color: AppColors.PRIMARY_DARK),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h / 25,
                  ),
                  ProfilePictureWidget(
                      fName: cc.landLordModel!.firstName,
                      email: cc.landLordModel!.email,
                      image: cc.landLordModel!.photo,
                      lName: cc.landLordModel!.lastName),
                  Padding(
                    padding: EdgeInsets.all(w / 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProfileButton(texta: 30.toString(), textb: "Listing"),
                        ProfileButton(texta: 12.toString(), textb: "Sold"),
                        ProfileButton(
                            texta: 28.toString(), textb: "Recommended"),
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
                                      text: "Basic Info",
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
                                      text: "Listing",
                                      colora: AppColors.GREYLIGHT,
                                      colorb: AppColors.WHITE,
                                      ontap: () {
                                        ctrl.changeFilteredIndex(1);
                                      },
                                      check: cc.filterationIndex == 1
                                          ? true
                                          : false,
                                    ),
                                    FilterationRow(
                                      text: "Contact",
                                      colora: AppColors.GREYLIGHT,
                                      colorb: AppColors.WHITE,
                                      ontap: () {
                                        ctrl.changeFilteredIndex(2);
                                      },
                                      check: cc.filterationIndex == 2
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
                                      data: cc.landLordModel!.firstName +
                                          " " +
                                          cc.landLordModel!.lastName,
                                      hint: "Name",
                                    ),
                                    SizedBox(
                                      height: h / 200,
                                    ),
                                    ProfileDetailsTile(
                                      data: cc.landLordModel!.email,
                                      hint: "Email",
                                    ),
                                    SizedBox(
                                      height: h / 200,
                                    ),
                                    ProfileDetailsTile(
                                      data: cc.landLordModel!.address ?? "N/A",
                                      hint: "Address",
                                    ),
                                    SizedBox(
                                      height: h / 200,
                                    ),
                                    ProfileDetailsTile(
                                      data: cc.landLordModel!.zipCode ?? "N/A",
                                      hint: "Zip Code",
                                    ),
                                    SizedBox(
                                      height: h / 200,
                                    ),
                                  ],
                                ),
                              )
                            : index == 1
                                ? Consumer<ProfileController>(
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
                                      itemCount: c.landLordListings.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return EstateWidget(
                                          model: c.landLordListings[index],
                                          index: index,
                                          like: () {},
                                          disLike: () {},
                                        );
                                      },
                                    );
                                  })
                                : Padding(
                                    padding: EdgeInsets.only(
                                        left: w / 20, right: w / 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        NormalText(
                                            text: 'Your Name?', size: 10),
                                        SizedBox(
                                          height: h / 80,
                                        ),
                                        MyTextField(
                                          text: 'Your Name',
                                          vPadding: 0,
                                          validate: (s) {},
                                          ctrl: TextEditingController(),
                                        ),
                                        SizedBox(
                                          height: h / 80,
                                        ),
                                        NormalText(
                                            text: 'Purpose of Contact?',
                                            size: 10),
                                        SizedBox(
                                          height: h / 80,
                                        ),
                                        MyTextField(
                                          text: 'Purpose',
                                          vPadding: 0,
                                          validate: (s) {},
                                          ctrl: TextEditingController(),
                                        ),
                                        SizedBox(
                                          height: h / 80,
                                        ),
                                        NormalText(text: 'Message', size: 10),
                                        SizedBox(
                                          height: h / 80,
                                        ),
                                        MyTextField(
                                          maxLines: 5,
                                          text: 'Message',
                                          vPadding: 5,
                                          validate: (s) {},
                                          ctrl: TextEditingController(),
                                        ),
                                        SizedBox(
                                          height: h / 20,
                                        ),
                                        CircularButton(
                                            ontap: () {},
                                            heightDivididedBy: 14,
                                            text: 'Send',
                                            widthDividedBy: 1),
                                        SizedBox(
                                          height: h / 20,
                                        ),
                                      ],
                                    ),
                                  );
                      })
                ],
              ),
            );
    });
  }
}
