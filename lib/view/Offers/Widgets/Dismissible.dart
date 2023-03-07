import 'package:bhaile/Constants/AppColors.dart';
import 'package:bhaile/Widgets/Texts.dart';
import 'package:bhaile/widgets/boldText.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DismissibleWidget extends StatelessWidget {
  final Key key;
  final VoidCallback onDismissed;
  final String src;
  final String title;
  final String notification;
  final String time;


  DismissibleWidget({
    required this.key,
    required this.title,
    required this.src,
    required this.notification,
    required this.time,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Dismissible(
      key: key,
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDismissed(),
      background: Container(


        decoration: BoxDecoration(
          color: AppColors.PRIMARY_DARK,
          borderRadius: BorderRadius.circular(w/20),

        ),

        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.delete_outline_sharp, color: Colors.white),
          ),
        ),
      ),
      child:Container(
        height: h/6.5,
        width: w/1,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(w/20),
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Padding(
              padding: EdgeInsets.all(w/30),
              child: Image.asset(src),
            ),


            Padding(
                padding:EdgeInsets.all(w/30),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Padding(
                    padding:  EdgeInsets.only(top: w/50,bottom: w/50),
                    child: Bold_Text(text: title, color: AppColors.PRIMARY_DARK, size: 10.sp),
                  ),

                  SimpleText(text: notification, color: AppColors.BLACK , size: 6.sp),

                  Padding(padding: EdgeInsets.all(w/50),
                  child: SimpleText(text:time,color: Colors.grey[500]!,size: 6.sp),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class DismissibleWidget2 extends StatelessWidget {
  final Key key;
  final VoidCallback onDismissed;
  final String src;
  final String title;
  final String notification;
  final String time;


  DismissibleWidget2({
    required this.key,
    required this.title,
    required this.src,
    required this.notification,
    required this.time,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Dismissible(
      key: key,
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDismissed(),
      background: Container(


        decoration: BoxDecoration(
          color: AppColors.PRIMARY_DARK,
          borderRadius: BorderRadius.circular(w/20),

        ),

        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.delete_outline_sharp, color: Colors.white),
          ),
        ),
      ),
      child:Container(
        height: h/8,
        width: w/1,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(w/20),
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Padding(
              padding: EdgeInsets.all(w/30),
              child: Image.asset(src),
            ),


            Padding(
              padding:EdgeInsets.all(w/30),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Padding(
                    padding:  EdgeInsets.only(top: w/50,bottom: w/50),
                    child: Bold_Text(text: title, color: AppColors.PRIMARY_DARK, size: 10.sp),
                  ),

                  SimpleText(text: notification, color: AppColors.BLACK , size: 6.sp),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
