import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../Widgets/Payment_widgets.dart';
import '../../../Widgets/Texts.dart';
import '../../../controllers/loginController.dart';
import '../../../controllers/payment_provider.dart';
import '../../../widgets/Buttons.dart';
import '../../../widgets/circularButton.dart';

class Payment extends StatelessWidget {
  const Payment({
    super.key,
    required this.h,
    required this.w,
    required this.ctrl2,
  });

  final double h;
  final double w;
  final MyProvider ctrl2;

  @override
  Widget build(BuildContext context) {
    var PController = context.read<LoginController>();


    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: h / 9,
          ),
          Align(
            alignment: Alignment(-w/550, 0),
            child: Rich_Text(
                texta: "Add your\n",
                textb: "payment method",
                size: 16.sp),
          ),
          SizedBox(
            height: h / 40,
          ),
          Align(
            alignment: Alignment(-w/2500, 0),
            child: SimpleText(
                text:
                "you can change this later on your account setting.",
                size: 8.sp,
                color: Colors.black),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: h / 80,
              ),
              Image.asset(
                "assets/Payments/card.png",
                width: 300,
                height: 240,
              ),
              Padding(
                padding: EdgeInsets.all(w / 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Icon_Button(
                          text: "paypal",
                          ontap: () {
                            ctrl2.changeCheck(1);
                          },
                          source:
                          "assets/Logo/paypal.png"),
                      SizedBox(
                        width: w / 20,
                      ),
                      Icon_Button(
                          text: "Mastercard",
                          ontap: () {
                            ctrl2.changeCheck(2);
                          },
                          source:
                          "assets/Logo/mastercard.png"),
                      SizedBox(
                        width: w / 20,
                      ),
                      Icon_Button(
                          text: "visa",
                          ontap: () {
                            ctrl2.changeCheck(2);
                          },
                          source: "assets/Logo/visa.png"),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: h / 30,
              ),
              Container(
                  width: w,
                  child: Consumer<MyProvider>(
                    builder: (co, ct, ch) => ct.num == 1
                        ? Paypal(width: w, height: h,ctrl:PController)
                        : ct.num == 2
                        ? Master_Card(
                        width: w, height: h,ctrl:PController)
                        : Container(),
                  )),


            ],
          ),
        ],
      ),
    );
  }
}