import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/AppColors.dart';
import '../../../Widgets/Texts.dart';
import '../Offers.dart';
import 'Dismissible.dart';

class Notfications extends StatelessWidget {
  const Notfications({
    super.key,
    required this.w,
    required this.h,
  });

  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(w/30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: h/20,),
          Row(
            children: [
              Offers_Container(w: w, h: h,text: "All",),

              SizedBox(width: w/30,),

              Offers_Container(w: w, h: h,text: "Sent",),

              SizedBox(width: w/30,),

              Container(
                padding: EdgeInsets.all(w/220),
                width: w/4,
                height: h/12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey[200],

                ),
                child: Text("Received"),alignment: Alignment.center,
              )

            ],
          ),

          SizedBox(height: h/30,),

          Bold_Text(text: "Today", color: AppColors.PRIMARY_DARK, size: 14.sp),


          SizedBox(height: h/30,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: EdgeInsets.only(top: w/80,bottom: w/80),
                child: DismissibleWidget(onDismissed: (){},
                  key: Key('item_1'),
                  title: "Emmette Perry",
                  notification:" Just messaged you. Check the message \n in message tab.",
                  src: "assets/Offers/img1.png", time: '10 min',


                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: w/80,bottom: w/80),
                child: DismissibleWidget(onDismissed: (){},
                  key: Key('item_2'),
                  title: "Geraldo",
                  notification:" Just 5 Star review on you listing",
                  src: "assets/Offers/img2.png", time: '10 min',


                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: w/80,bottom: w/80),
                child: DismissibleWidget(onDismissed: (){},
                  key: Key('item_3'),
                  title: "Emmette Perry",
                  notification:" Just messaged you. Check the message \n in message tab.",
                  src: "assets/Offers/img1.png", time: '10 min',

                ),
              ),

            ],
          ),


          SizedBox(height: h/30,),

          Bold_Text(text: "Older Notifications", color: AppColors.PRIMARY_DARK, size: 14.sp),


          SizedBox(height: h/30,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [



              Padding(
                padding: EdgeInsets.only(top: w/80,bottom: w/80),
                child: DismissibleWidget(onDismissed: (){},
                  key: Key('item_2'),
                  title: "Geraldo",
                  notification:" Just 5 Star review on you listing",
                  src: "assets/Offers/img2.png", time: '10 min',


                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: w/80,bottom: w/80),
                child: DismissibleWidget(onDismissed: (){},
                  key: Key('item_3'),
                  title: "Emmette Perry",
                  notification:" Just messaged you. Check the message \n in message tab.",
                  src: "assets/Offers/img1.png", time: '10 min',

                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}