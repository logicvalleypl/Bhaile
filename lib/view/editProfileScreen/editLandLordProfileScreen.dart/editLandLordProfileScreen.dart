import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Constants/AppColors.dart';
import '../../../controllers/payment_provider.dart';
import '../../../controllers/profileControllers/editProfileController.dart';
import '../../../controllers/profileControllers/profileController.dart';
import '../../../widgets/boldText.dart';
import '../../profileScreen/widgets/filterationRow.dart';
import '../widgets/Chnage_Password.dart';
import '../widgets/Payment.dart';
import 'editLandlordWidget.dart';

class EditLandLordProfileScreen extends StatelessWidget {
  const EditLandLordProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var ctrl = context.read<EditProfileController>();
    var ctrl2 = context.read<MyProvider>();
    // TextEditingController emailCtrl = TextEditingController();
    TextEditingController passwordCtrl = TextEditingController();
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: h / 30,
            ),
            Padding(
              padding: EdgeInsets.all(w / 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<ProfileController>().getProfile();
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: w / 50, top: w / 50),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.WHITE,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w / 5,
                  ),
                  BoldText(
                      text: "Edit Profile",
                      color: AppColors.PRIMARY_DARK,
                      size: 16),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(w / 30),
              child: Container(
                  width: w / 1,
                  height: h / 14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.grey[200],
                  ),
                  child: Consumer<EditProfileController>(
                      builder: (co, ct, ch) =>
                          // ct.filterationIndex == 0
                          // ?
                          Row(
                            // scrollDirection: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FilterationRow(
                                widthDividedBy: 5,
                                text: "Edit Profile",
                                colora: AppColors.GREYLIGHT,
                                colorb: AppColors.WHITE,
                                ontap: () {
                                  ctrl.changeFilteredIndex(0);
                                },
                                check: ct.filterationIndex == 0 ? true : false,
                              ),
                              FilterationRow(
                                widthDividedBy: 6,
                                text: "Change Password",
                                colora: AppColors.GREYLIGHT,
                                colorb: AppColors.WHITE,
                                ontap: () {
                                  ctrl.changeFilteredIndex(1);
                                },
                                check: ct.filterationIndex == 1 ? true : false,
                              ),
                              FilterationRow(
                                widthDividedBy: 6,
                                text: "Payment Details",
                                colora: AppColors.GREYLIGHT,
                                colorb: AppColors.WHITE,
                                ontap: () {
                                  ctrl.changeFilteredIndex(2);
                                },
                                check: ct.filterationIndex == 2 ? true : false,
                              ),
                              FilterationRow(
                                text: "Logout",
                                widthDividedBy: 6,
                                colora: AppColors.GREYLIGHT,
                                colorb: AppColors.WHITE,
                                ontap: () {
                                  ctrl.changeFilteredIndex(2);
                                },
                                check: ct.filterationIndex == 3 ? true : false,
                              ),
                            ],
                          ))),
            ),
            Consumer<ProfileController>(
              builder: (co, ct, ch) => ct.filterationIndex == 0
                  ? EditLandLordWidget(
                      landLordModel: ct.landLordModel!,
                    )
                  : ct.filterationIndex == 1
                      ? Change_Password(w: w, passwordCtrl: passwordCtrl, h: h)
                      : Payment(h: h, w: w, ctrl2: ctrl2),
            ),
          ],
        ),
      ),
    );
  }
}
