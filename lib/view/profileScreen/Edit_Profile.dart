import 'package:bhaile/Widgets/Texts.dart';
import 'package:bhaile/view/Welcome_Screens/Payment_one.dart';
import 'package:bhaile/view/profileScreen/widgets/Chnage_Password.dart';
import 'package:bhaile/view/profileScreen/widgets/Edit_Profile_Widget.dart';
import 'package:bhaile/view/profileScreen/widgets/Payment.dart';
import 'package:bhaile/view/profileScreen/widgets/Row_Box.dart';
import 'package:bhaile/widgets/Form_Feilds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/AppColors.dart';
import '../../Widgets/Payment_widgets.dart';
import '../../controllers/Profile_Controller.dart';
import '../../controllers/payment_provider.dart';
import '../../widgets/Buttons.dart';
import '../../widgets/circularButton.dart';

class Edit_Profile extends StatefulWidget {
  const Edit_Profile({Key? key}) : super(key: key);

  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  @override
  Widget build(BuildContext context) {
    var ctrl = context.read<Profile_Controller>();
    var ctrl2 = context.read<MyProvider>();
    TextEditingController emailCtrl = TextEditingController();
    TextEditingController passwordCtrl = TextEditingController();
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(w / 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
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
                      Bold_Text(
                          text: "Edit Profile",
                          color: AppColors.PRIMARY_DARK,
                          size: 16.sp),
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
                      child: Consumer<Profile_Controller>(
                        builder: (co, ct, ch) => ct.check == 0
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Profile_Row_Box(
                                    w: w,
                                    h: h,
                                    text: "Edit Profile",
                                    colora: AppColors.WHITE,
                                    colorb: AppColors.PRIMARY_DARK,
                                    ontap: () {
                                      ctrl.changeCheck(0);
                                    },
                                    check: false,
                                  ),
                                  Profile_Row_Box(
                                    w: w,
                                    h: h,
                                    text: "Change Password",
                                    colora: Colors.grey[200]!,
                                    colorb: AppColors.GREY,
                                    ontap: () {
                                      ctrl.changeCheck(1);
                                    },
                                    check: false,
                                  ),
                                  Profile_Row_Box(
                                    w: w,
                                    h: h,
                                    text: "Payment Details",
                                    colora: Colors.grey[200]!,
                                    colorb: AppColors.GREY,
                                    ontap: () {
                                      ctrl.changeCheck(2);
                                    },
                                    check: false,
                                  ),
                                  Profile_Row_Box(
                                    w: w,
                                    h: h,
                                    text: "Logout",
                                    colora: Colors.grey[200]!,
                                    colorb: AppColors.GREY,
                                    ontap: () {
                                      ctrl.changeCheck(3);
                                    },
                                    check: false,
                                  ),
                                ],
                              )
                            : ct.check == 1
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Profile_Row_Box(
                                        w: w,
                                        h: h,
                                        text: "Edit Profile",
                                        colora: Colors.grey[200]!,
                                        colorb: AppColors.GREY,
                                        ontap: () {
                                          ctrl.changeCheck(0);
                                        },
                                        check: false,
                                      ),
                                      Profile_Row_Box(
                                        w: w,
                                        h: h,
                                        text: "Change Password",
                                        colora: AppColors.WHITE,
                                        colorb: AppColors.PRIMARY_DARK,
                                        ontap: () {
                                          ctrl.changeCheck(1);
                                        },
                                        check: false,
                                      ),
                                      Profile_Row_Box(
                                        w: w,
                                        h: h,
                                        text: "Payment Details",
                                        colora: Colors.grey[200]!,
                                        colorb: AppColors.GREY,
                                        ontap: () {
                                          ctrl.changeCheck(2);
                                        },
                                        check: false,
                                      ),
                                      Profile_Row_Box(
                                        w: w,
                                        h: h,
                                        text: "Logout",
                                        colora: Colors.grey[200]!,
                                        colorb: AppColors.GREY,
                                        ontap: () {
                                          ctrl.changeCheck(3);
                                        },
                                        check: false,
                                      ),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Profile_Row_Box(
                                        w: w,
                                        h: h,
                                        text: "Edit Profile",
                                        colora: Colors.grey[200]!,
                                        colorb: AppColors.GREY,
                                        ontap: () {
                                          ctrl.changeCheck(0);
                                        },
                                        check: false,
                                      ),
                                      Profile_Row_Box(
                                        w: w,
                                        h: h,
                                        text: "Change Password",
                                        colora: Colors.grey[200]!,
                                        colorb: AppColors.GREY,
                                        ontap: () {
                                          ctrl.changeCheck(1);
                                        },
                                        check: false,
                                      ),
                                      Profile_Row_Box(
                                        w: w,
                                        h: h,
                                        text: "Payment Details",
                                        colora: AppColors.WHITE,
                                        colorb: AppColors.PRIMARY_DARK,
                                        ontap: () {
                                          ctrl.changeCheck(2);
                                        },
                                        check: false,
                                      ),
                                      Profile_Row_Box(
                                        w: w,
                                        h: h,
                                        text: "Logout",
                                        colora: Colors.grey[200]!,
                                        colorb: AppColors.GREY,
                                        ontap: () {
                                          ctrl.changeCheck(3);
                                        },
                                        check: false,
                                      ),

                                    ],
                                  ),
                      )),
                ),
                Consumer<Profile_Controller>(
                  builder: (co, ct, ch) => ct.check == 0
                      ? Edit_Profile_Widget(h: h, w: w, passwordCtrl: passwordCtrl)
                      : ct.check == 1
                          ? Change_Password(w: w, passwordCtrl: passwordCtrl, h: h)
                          : ct.check == 2?Payment(h: h, w: w, ctrl2: ctrl2):Container(
                    child: Text("Logout"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





