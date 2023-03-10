import 'package:bhaile/view/editProfileScreen/editAgentProfileScreen/editAgentProfileScreen.dart';
import 'package:bhaile/view/profileScreen/agentProfile/widgets/AgentContactWidget.dart';
import 'package:bhaile/view/profileScreen/agentProfile/widgets/agentBasicInfoWidget.dart';
import 'package:bhaile/view/profileScreen/agentProfile/widgets/agentListingWidget.dart';
import 'package:bhaile/view/profileScreen/widgets/profilePictureWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Constants/AppColors.dart';
import '../../../controllers/profileControllers/profileController.dart';
import '../../../widgets/boldText.dart';
import '../widgets/filterationRow.dart';
import '../widgets/profileButton.dart';

class AgentProfileScreen extends StatelessWidget {
  const AgentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var ctrl = context.read<ProfileController>();

    return Consumer<ProfileController>(builder: (context, cc, child) {
      return SingleChildScrollView(
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
                                      EditAgentProfileScreen()));
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
                fName: cc.agentModel!.firstName,
                email: cc.agentModel!.email,
                image: cc.agentModel!.photo,
                lName: cc.agentModel!.lastName),
            SizedBox(
              height: h / 40,
            ),
            Padding(
              padding: EdgeInsets.all(w / 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileButton(texta: 30.toString(), textb: "Listings"),
                  ProfileButton(texta: 12.toString(), textb: "Sold"),
                  ProfileButton(texta: 28.toString(), textb: "Reviews"),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FilterationRow(
                                widthDividedBy: 3,
                                text: "Basic Information",
                                colora: AppColors.GREYLIGHT,
                                colorb: AppColors.WHITE,
                                ontap: () {
                                  ctrl.changeFilteredIndex(0);
                                },
                                check: cc.filterationIndex == 0 ? true : false,
                              ),
                              FilterationRow(
                                text: "Listing",
                                colora: AppColors.GREYLIGHT,
                                colorb: AppColors.WHITE,
                                ontap: () {
                                  ctrl.changeFilteredIndex(1);
                                },
                                check: cc.filterationIndex == 1 ? true : false,
                              ),
                            ],
                          ))),
            ),
            Selector<ProfileController, int>(
                selector: (p0, p1) => p1.filterationIndex,
                builder: (context, filterationIndex, child) {
                  return filterationIndex == 0
                      ? AgentBasicInfoWidget(
                          agentModel: cc.agentModel!,
                        )

                      // AgentBasicInfoWidget()
                      : filterationIndex == 1
                          ? AgentListingWidget()
                          : AgentContactWidget();
                })
          ],
        ),
      );
    });
  }
}
