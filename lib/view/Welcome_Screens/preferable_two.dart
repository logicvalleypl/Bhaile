import 'package:bhaile/view/bottomNavBar/bottomNavigationBar.dart';
import 'package:bhaile/widgets/Buttons.dart';
import 'package:bhaile/widgets/Texts.dart';
import 'package:bhaile/widgets/circularButton.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/AppColors.dart';

class PreferableTwo extends StatelessWidget {
  PreferableTwo({Key? key, required this.type}) : super(key: key);

  String type;
  List<String> commercialImage = [
    'assets/preferable/pd.png',
    'assets/preferable/pc.png',
    'assets/preferable/pb.png',
    'assets/preferable/pa.png',
  ];
  List<String> residentialImage = [
    'assets/preferable/pa.png',
    'assets/preferable/pb.png',
    'assets/preferable/pc.png',
    'assets/preferable/pd.png',
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: width / 50, top: width / 50),
                    child: const CircleAvatar(
                      backgroundColor: AppColors.GREY,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.WHITE,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height / 17,
                ),
                Rich_Text(
                    texta: "You have successfully\n",
                    textb: "selected $type",
                    size: 20.sp),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Preferance_Button(
                      width: width,
                      height: height,
                      text: type == 'Residential' ? "Apartment" : 'Office',
                      imgsource: type == 'Residential'
                          ? residentialImage[0]
                          : commercialImage[0],
                      color: Colors.grey[100]!,
                    ),
                    SizedBox(
                      width: width / 20,
                    ),
                    Preferance_Button(
                        width: width,
                        height: height,
                        text: type == 'Residential' ? "Villa" : 'Office',
                        imgsource: type == 'Residential'
                            ? residentialImage[1]
                            : commercialImage[1],
                        color: Colors.grey[100]!),
                  ],
                ),
                SizedBox(
                  height: height / 80,
                ),
                type == 'Residential'
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Preferance_Button(
                              width: width,
                              height: height,
                              text: "House",
                              imgsource: type == 'Residential'
                                  ? residentialImage[2]
                                  : commercialImage[2],
                              color: Colors.grey[100]!),
                          SizedBox(
                            width: width / 20,
                          ),
                          Preferance_Button(
                              width: width,
                              height: height,
                              text: "Cottage",
                              imgsource: type == 'Residential'
                                  ? residentialImage[3]
                                  : commercialImage[3],
                              color: Colors.grey[100]!),
                        ],
                      )
                    : Container(),
              ],
            ),

            SizedBox(
              height: height / 40,
            ),
            CircularButton(
              ontap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNavigationBarScreen()),
                    (route) => false);
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              heightDivididedBy: 12,
              text: 'Go to Home',
              widthDividedBy: 1.35,
            ),

            //TextButton(onPressed: , child: child)
          ],
        ),
      ),
    );
  }
}
