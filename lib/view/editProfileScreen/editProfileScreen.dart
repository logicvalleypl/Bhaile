// import 'package:bhaile/Widgets/Texts.dart';
// import 'package:bhaile/view/editProfileScreen/widgets/Chnage_Password.dart';
// import 'package:bhaile/view/editProfileScreen/widgets/Edit_Profile_Widget.dart';
// import 'package:bhaile/view/editProfileScreen/widgets/Payment.dart'; 
// import 'package:bhaile/view/profileScreen/widgets/filterationRow.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';

// import '../../Constants/AppColors.dart';
// import '../../controllers/payment_provider.dart';
// import '../../controllers/profileController.dart';

// class EditProfileScreen extends StatelessWidget {
//   const EditProfileScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var ctrl = context.read<ProfileController>();
//     var ctrl2 = context.read<MyProvider>();
//     TextEditingController emailCtrl = TextEditingController();
//     TextEditingController passwordCtrl = TextEditingController();
//     var w = MediaQuery.of(context).size.width;
//     var h = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(w / 30),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.only(left: w / 50, top: w / 50),
//                         child: CircleAvatar(
//                           backgroundColor: Colors.grey[300],
//                           child: Icon(
//                             Icons.arrow_back_ios,
//                             color: AppColors.WHITE,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: w / 5,
//                     ),
//                     Bold_Text(
//                         text: "Edit Profile",
//                         color: AppColors.PRIMARY_DARK,
//                         size: 16.sp),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(w / 30),
//                 child: Container(
//                     width: w / 1,
//                     height: h / 14,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(40),
//                       color: Colors.grey[200],
//                     ),
//                     child: Consumer<ProfileController>(
//                       builder: (co, ct, ch) => ct.filterationIndex == 0
//                           ? Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 FilterationRow(
//                                   text: "Edit Profile",
//                                   colora: AppColors.WHITE,
//                                   colorb: AppColors.PRIMARY_DARK,
//                                   ontap: () {
//                                     ctrl.changeFilteredIndex(0);
//                                   },
//                                   check: false,
//                                 ),
//                                 FilterationRow(
//                                   text: "Change Password",
//                                   colora: Colors.grey[200]!,
//                                   colorb: AppColors.GREY,
//                                   ontap: () {
//                                     ctrl.changeFilteredIndex(1);
//                                   },
//                                   check: false,
//                                 ),
//                                 FilterationRow(
//                                   text: "Payment Details",
//                                   colora: Colors.grey[200]!,
//                                   colorb: AppColors.GREY,
//                                   ontap: () {
//                                     ctrl.changeFilteredIndex(2);
//                                   },
//                                   check: false,
//                                 ),
//                                 FilterationRow(
//                                   text: "Logout",
//                                   colora: Colors.grey[200]!,
//                                   colorb: AppColors.GREY,
//                                   ontap: () {
//                                     ctrl.changeFilteredIndex(2);
//                                   },
//                                   check: false,
//                                 ),
//                               ],
//                             )
//                           : ct.filterationIndex == 1
//                               ? Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     FilterationRow(
//                                       text: "Edit Profile",
//                                       colora: Colors.grey[200]!,
//                                       colorb: AppColors.GREY,
//                                       ontap: () {
//                                         ctrl.changeFilteredIndex(0);
//                                       },
//                                       check: false,
//                                     ),
//                                     FilterationRow(
//                                       text: "Change Password",
//                                       colora: AppColors.WHITE,
//                                       colorb: AppColors.PRIMARY_DARK,
//                                       ontap: () {
//                                         ctrl.changeFilteredIndex(1);
//                                       },
//                                       check: false,
//                                     ),
//                                     FilterationRow(
//                                       text: "Payment Details",
//                                       colora: Colors.grey[200]!,
//                                       colorb: AppColors.GREY,
//                                       ontap: () {
//                                         ctrl.changeFilteredIndex(2);
//                                       },
//                                       check: false,
//                                     ),
//                                     FilterationRow(
//                                       text: "Logout",
//                                       colora: Colors.grey[200]!,
//                                       colorb: AppColors.GREY,
//                                       ontap: () {
//                                         ctrl.changeFilteredIndex(2);
//                                       },
//                                       check: false,
//                                     ),
//                                   ],
//                                 )
//                               : Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     FilterationRow(
//                                       text: "Edit Profile",
//                                       colora: Colors.grey[200]!,
//                                       colorb: AppColors.GREY,
//                                       ontap: () {
//                                         ctrl.changeFilteredIndex(0);
//                                       },
//                                       check: false,
//                                     ),
//                                     FilterationRow(
//                                       text: "Change Password",
//                                       colora: Colors.grey[200]!,
//                                       colorb: AppColors.GREY,
//                                       ontap: () {
//                                         ctrl.changeFilteredIndex(1);
//                                       },
//                                       check: false,
//                                     ),
//                                     FilterationRow(
//                                       text: "Payment Details",
//                                       colora: AppColors.WHITE,
//                                       colorb: AppColors.PRIMARY_DARK,
//                                       ontap: () {
//                                         ctrl.changeFilteredIndex(2);
//                                       },
//                                       check: false,
//                                     ),
//                                     FilterationRow(
//                                       text: "Logout",
//                                       colora: Colors.grey[200]!,
//                                       colorb: AppColors.GREY,
//                                       ontap: () {},
//                                       check: false,
//                                     ),
//                                   ],
//                                 ),
//                     )),
//               ),
//               Consumer<ProfileController>(
//                 builder: (co, ct, ch) => ct.filterationIndex == 0
//                     ? Edit_Profile_Widget(
//                         h: h, w: w, passwordCtrl: passwordCtrl)
//                     : ct.filterationIndex == 1
//                         ? Change_Password(
//                             w: w, passwordCtrl: passwordCtrl, h: h)
//                         : Payment(h: h, w: w, ctrl2: ctrl2),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
