

import 'package:flutter/material.dart';

import '../../Constants/AppColors.dart';
import '../../Widgets/Texts.dart';
import '../../widgets/Buttons.dart';
import '../profileScreen/widgets/Row_Box.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {


  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView
          (
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(w/30),
              child: Column(
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
                      Icon_Buttonn(w: w, h: h,icon: Icon(Icons.delete_outline_sharp,color: AppColors.PRIMARY_DARK,),ontap: () {}),

                    ],
                  ),

                  SizedBox(
                    height: h/20,
                  ),

                  Container(

                    width: w / 1,
                    height: h / 14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.grey[200],
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Offers_Row_Box(
                        w: w,
                        h: h,

                        text: "Notifications",
                        ontap: (){},
                        colora: AppColors.WHITE,
                        colorb: AppColors.PRIMARY_DARK,
                      ),
                        Offers_Row_Box(
                          w: w,
                          h: h,

                          text: "Messages",
                          ontap: (){},
                          colora: AppColors.WHITE,
                          colorb: AppColors.PRIMARY_DARK,
                        ),

                      ]

                    ),


                  ),


                  SizedBox(height: h/20,),
                  Row(
                    children: [
                     Container(

                        padding: EdgeInsets.all(w/220),
                        width: w/4.8,
                        height: h/12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.grey[200],

                        ),
                       child: Text("All"),alignment: Alignment.center,
                      ),

                      SizedBox(width: w/30,),

                    ],
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
