import 'package:bhaile/constants/AppColors.dart';
import 'package:bhaile/controllers/payment_provider.dart';
import 'package:bhaile/view/Welcome_Screens/Location_one.dart';
import 'package:bhaile/view/Welcome_Screens/User.dart';
import 'package:bhaile/widgets/Buttons.dart';
import 'package:bhaile/widgets/Payment_widgets.dart';
import 'package:bhaile/widgets/Texts.dart';
import 'package:bhaile/widgets/circularButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Payment_one extends StatefulWidget {
  const Payment_one({Key? key}) : super(key: key);

  @override
  State<Payment_one> createState() => _Payment_oneState();
}

class _Payment_oneState extends State<Payment_one> {
//   int check=0;
//   changeCheck(){
//
//     check =context.watch<provider>().check;
// }

  @override
  Widget build(BuildContext context) {
    var ctrl = context.read<MyProvider>();

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          // child: Stack(
          //   children: [
          //     Positioned(
          //       top: 10.sp,
          //       left: 10.sp,
          //       child: SmallButton(
          //         text: "<",
          //         ontap: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => Location_one()));
          //         },
          //         check: false,
          //       ),
          //     ),
          //     Positioned(
          //       top: 10.sp,
          //       right: 10.sp,
          //       child: SmallButton(
          //         text: "skip",
          //         ontap: () {},
          //         check: true,
          //       ),
          //     ),
          //
          //     SingleChildScrollView(
          //       child: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           SizedBox(
          //             height: height / 9,
          //           ),
          //           Align(
          //             alignment: Alignment(-0.6.sp, 0.sp),
          //             child: Rich_Text(
          //                 texta: "Add your\n",
          //                 textb: "payment method",
          //                 size: 20.sp),
          //           ),
          //           SizedBox(
          //             height: height / 40,
          //           ),
          //           Align(
          //             alignment: Alignment(-0.4.sp, 0.sp),
          //             child: SimpleText(
          //                 text:
          //                     "you can change this later on your account setting.",
          //                 size: 10.sp,
          //                 color: Colors.black),
          //           ),
          //           Column(
          //             mainAxisAlignment: MainAxisAlignment.start,
          //             children: [
          //               SizedBox(
          //                 height: height / 80,
          //               ),
          //               Image.asset(
          //                 "assets/Payments/card.png",
          //                 width: 300,
          //                 height: 240,
          //               ),
          //               SingleChildScrollView(
          //                 scrollDirection: Axis.horizontal,
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.start,
          //                   children: [
          //                     Icon_Button(
          //                         text: "paypal",
          //                         ontap: () {
          //                           ctrl.changeCheck(1);
          //                         },
          //                         source: "assets/Logo/paypal.png"),
          //                     SizedBox(
          //                       width: width / 20,
          //                     ),
          //                     Icon_Button(
          //                         text: "Mastercard",
          //                         ontap: () {
          //                           ctrl.changeCheck(2);
          //                         },
          //                         source: "assets/Logo/mastercard.png"),
          //                     SizedBox(
          //                       width: width / 20,
          //                     ),
          //                     Icon_Button(
          //                         text: "visa",
          //                         ontap: () {
          //                           ctrl.changeCheck(2);
          //                         },
          //                         source: "assets/Logo/visa.png"),
          //                   ],
          //                 ),
          //               ),
          //               SizedBox(
          //                 height: height / 30,
          //               ),
          //               Container(
          //                   width: width,
          //                   child: Consumer<MyProvider>(
          //                     builder: (co, ct, ch) => ct.num == 1
          //                         ? Paypal(width: width, height: height)
          //                         : ct.num == 2
          //                             ? Master_Card(
          //                                 width: width, height: height)
          //                             : Container(),
          //                   )),
          //               SizedBox(
          //                 height: height / 30,
          //               ),
          //               CircularButton(
          //                 ontap: () {
          //                   Navigator.push(
          //                       context,
          //                       MaterialPageRoute(
          //                           builder: (context) => User()));
          //                 },
          //                 heightDivididedBy: 12,
          //                 text: 'Next',
          //                 widthDividedBy: 1.35,
          //               ),
          //               // MainButton(
          //               //     height: height,
          //               //     width: width,
          //               //     color: AppColors.PRIMARY,
          //               //     text: "Next",
          //               //     ontap: () {
          //               //       Navigator.push(
          //               //           context,
          //               //           MaterialPageRoute(
          //               //               builder: (context) => User()));
          //               //     }),
          //             ],
          //           ),
          //         ],
          //       ),
          //     ),
          //     //TextButton(onPressed: , child: child)
          //   ],
          // ),
        ),
      ),
    );
  }
}
