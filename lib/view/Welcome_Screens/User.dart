import 'package:bhaile/constants/AppColors.dart';
import 'package:bhaile/view/Welcome_Screens/Location_one.dart';
import 'package:bhaile/widgets/Buttons.dart';
import 'package:bhaile/widgets/Form_Feilds.dart';
import 'package:bhaile/widgets/Texts.dart';
import 'package:bhaile/widgets/circularButton.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: Row(
                  children: [
                    SmallButton(
                      text: "<",
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Location_one()));
                      },
                      check: false,
                    ),
                    SizedBox(
                      width: width / 1.7,
                    ),
                    SmallButton(
                      text: "skip",
                      ontap: () {},
                      check: true,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / 14,
              ),
              Align(
                alignment: Alignment(-width / 600, 0),
                child: Rich_Text(
                  size: 20.sp,
                  texta: "Fill your ",
                  textb: "information \nbelow",
                ),
              ),
              SizedBox(
                height: height / 30,
              ),
              Align(
                  alignment: Alignment(-width / 800, 0),
                  child: SimpleText(
                    text: "you can edit this later on your account setting",
                    size: 10.sp,
                    color: AppColors.BLACK,
                  )),
              SizedBox(
                height: height / 14,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: width / 1.1,
                  height: height / 9,
                  child: Align(
                      alignment: Alignment.center, child: Icon(Icons.add)),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[400],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(19.sp),
                child: Column(children: [
                  Input_Feild(
                    ctrl: TextEditingController(),
                    validate: (a) {},
                    text: "Name",
                    icon: Icon(Icons.account_circle_outlined),
                  ),
                  SizedBox(
                    height: height / 60,
                  ),
                  Input_Feild(
                    validate: (a) {},
                    ctrl: TextEditingController(),
                    text: "Phone number",
                    icon: Icon(Icons.account_circle_outlined),
                  ),
                  SizedBox(
                    height: height / 60,
                  ),
                  Input_Feild(
                    validate: (a) {},
                    ctrl: TextEditingController(),
                    text: "Email",
                    icon: Icon(Icons.account_circle_outlined),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  CircularButton(
                    ontap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.amber,
                            ),
                            height: height / 2,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('Modal BottomSheet'),
                                  ElevatedButton(
                                    child: const Text('Close BottomSheet'),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    heightDivididedBy: 12,
                    text: 'Show more',
                    widthDividedBy: 1.35,
                  ),

                  // MainButton(
                  //     width: width,
                  //     height: height,
                  //     text: "Finish",
                  //     color: AppColors.PRIMARY,
                  //     ontap: () {
                  //       showModalBottomSheet<void>(
                  //         context: context,
                  //         builder: (BuildContext context) {
                  //           return Container(
                  //             decoration: BoxDecoration(
                  //               color: Colors.amber,
                  //             ),
                  //             height: height / 2,
                  //             child: Center(
                  //               child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 mainAxisSize: MainAxisSize.min,
                  //                 children: [
                  //                   const Text('Modal BottomSheet'),
                  //                   ElevatedButton(
                  //                     child: const Text('Close BottomSheet'),
                  //                     onPressed: () => Navigator.pop(context),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           );
                  //         },
                  //       );
                  //     })
                ]),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
