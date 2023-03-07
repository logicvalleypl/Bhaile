import 'package:bhaile/controllers/Offers_Controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/AppColors.dart';
import '../../Widgets/Texts.dart';
import '../../widgets/Buttons.dart';
import '../profileScreen/widgets/Row_Box.dart';
import 'Widgets/Dismissible.dart';
import 'Widgets/Notifications.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    var ctrl = context.read<Offers_Controller>();
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(w / 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: w / 80,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.WHITE,
                        ),
                      ),
                      SizedBox(
                        width: w / 1.5,
                      ),
                      Icon_Buttonn(
                          w: w,
                          h: h,
                          icon: Icon(
                            Icons.delete_outline_sharp,
                            color: AppColors.PRIMARY_DARK,
                          ),
                          ontap: () {}),
                    ],
                  ),
                  SizedBox(
                    height: h / 20,
                  ),
                  Container(
                      width: w / 1,
                      height: h / 14,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.grey[200],
                      ),
                      child: Consumer<Offers_Controller>(
                        builder: (co, ct, ch) => ct.num == 1
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                    Offers_Row_Box(
                                      w: w,
                                      h: h,
                                      text: "Notifications",
                                      ontap: () {
                                        ctrl.changeCheck(1);
                                      },
                                      colora: AppColors.WHITE,
                                      colorb: AppColors.PRIMARY_DARK,
                                    ),
                                    Offers_Row_Box(
                                      w: w,
                                      h: h,
                                      text: "Messages",
                                      ontap: () {
                                        ctrl.changeCheck(0);
                                      },
                                      colora: Colors.grey[200]!,
                                      colorb: AppColors.PRIMARY_DARK,
                                    ),
                                  ])
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                    Offers_Row_Box(
                                      w: w,
                                      h: h,
                                      text: "Notifications",
                                      ontap: () {
                                        ctrl.changeCheck(1);
                                      },
                                      colora: Colors.grey[200]!,
                                      colorb: AppColors.PRIMARY_DARK,
                                    ),
                                    Offers_Row_Box(
                                      w: w,
                                      h: h,
                                      text: "Messages",
                                      ontap: () {
                                        ctrl.changeCheck(0);
                                      },
                                      colora: AppColors.WHITE,
                                      colorb: AppColors.PRIMARY_DARK,
                                    ),
                                  ]),
                      )),
                  Consumer<Offers_Controller>(
                    builder: (co, ct, ch) => ct.num == 1
                        ? Notfications(w: w, h: h)
                        : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  EdgeInsets.all(w/30),
                                child: Bold_Text(
                                    text: "All Chats",
                                    color: AppColors.PRIMARY_DARK,
                                    size: 14.sp),
                              ),
                              Padding(
                                padding:EdgeInsets.only(top: w/80,bottom:w/80 ),
                                child: DismissibleWidget2(
                                    key: Key('item_1'),
                                    title: "Milano ",
                                    src: "assets/Offers/img1.png",
                                    notification: "hi! how are you?",
                                    time: '',
                                    onDismissed: (){}),
                              ),

                              Padding(
                                padding:EdgeInsets.only(top: w/80,bottom:w/80 ),
                                child: DismissibleWidget2(
                                    key: Key('item_2'),
                                    title: "Milano ",
                                    src: "assets/Offers/img1.png",
                                    notification: "hi! how are you?",
                                    time: '',
                                    onDismissed: (){}),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Offers_Container extends StatelessWidget {
  const Offers_Container({
    super.key,
    required this.w,
    required this.h,
    required this.text,
  });

  final double w;
  final double h;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(w / 220),
      width: w / 4.8,
      height: h / 12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.grey[200],
      ),
      child: Text(text),
      alignment: Alignment.center,
    );
  }
}
