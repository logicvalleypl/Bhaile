import 'package:bhaile/constants/AppColors.dart';
import 'package:bhaile/view/Welcome_Screens/preferable_two.dart';
import 'package:bhaile/widgets/Texts.dart';
import 'package:bhaile/widgets/boldText.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/circularButton.dart';

class Preferable_one extends StatefulWidget {
  const Preferable_one({Key? key}) : super(key: key);

  @override
  State<Preferable_one> createState() => _Preferable_oneState();
}

class _Preferable_oneState extends State<Preferable_one> {
  bool isCommercial = true;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: width / 50),
                    child: const CircleAvatar(
                      backgroundColor: AppColors.GREY,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.WHITE,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(width / 40),
                  child: CircularButton(
                      ontap: () {},
                      heightDivididedBy: 25,
                      radius: 20,
                      color: AppColors.GREY,
                      text: 'Skip',
                      fontSize: 8.sp,
                      widthDividedBy: 6),
                )
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Rich_Text(
                    texta: "Select your Preferable\n",
                    textb: "real estate type",
                    size: 20.sp),
                SizedBox(
                  height: height / 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: SimpleText(
                      align: TextAlign.center,
                      text:
                          "You can change this later on your account setting.",
                      size: 10.sp,
                      color: Colors.black),
                ),
              ],
            ),
            PreferableType(
              checked: isCommercial,
              callback: () {
                setState(() {
                  isCommercial = true;
                });
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => PreferableTwo(
                //               type: 'Commercial',
                //             )));
              },
              text: 'Commercial',
              image: "assets/preferable/imge.png",
            ),
            SizedBox(
              height: height / 50,
            ),
            PreferableType(
                checked: !isCommercial,
                callback: () {
                  setState(() {
                    isCommercial = false;
                  });
                },
                text: 'Residential',
                image: "assets/preferable/imga.png"),
            SizedBox(
              height: height / 20,
            ),
            CircularButton(
                ontap: () {
                  if (isCommercial) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreferableTwo(
                                  type: "Commercial",
                                )));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreferableTwo(
                                  type: "Residential",
                                )));
                  }
                },
                heightDivididedBy: 12,
                text: "Next",
                widthDividedBy: 1.5)
          ],
        ),
      ),
    );
  }
}

class PreferableType extends StatelessWidget {
  PreferableType({
    super.key,
    required this.text,
    required this.callback,
    required this.checked,
    required this.image,
  });
  VoidCallback callback;
  bool checked;
  String image;
  String text;

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: callback,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height / 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  // Positioned(child: CircleAvatar)
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    child: Image.asset(
                      image,
                      height: height / 5,
                      width: height / 5,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                      child: Padding(
                    padding:
                        EdgeInsets.only(right: height / 100, top: height / 100),
                    child: Icon(
                      checked
                          ? Icons.radio_button_checked
                          : Icons.radio_button_off,
                      color: AppColors.WHITE,
                    ),
                  )),
                ],
              ),
              // ClipRRect(
              //   borderRadius: BorderRadius.only(
              //       topRight: Radius.circular(20),
              //       bottomRight: Radius.circular(20)),
              //   child: Image.asset(
              //     images[1],
              //     height: height / 5,
              //     width: height / 5,
              //     fit: BoxFit.fill,
              //   ),
              // ),
            ],
          ),
          SizedBox(
            height: height / 50,
          ),
          BoldText(
            text: text,
            size: 12.sp,
            color: AppColors.PRIMARY_DARK,
          ),
        ],
      ),
    );
  }
}
