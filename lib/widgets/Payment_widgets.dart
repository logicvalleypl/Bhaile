import 'package:bhaile/controllers/loginController.dart';
import 'package:bhaile/widgets/Form_Feilds.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../view/profileScreen/widgets/Small_feilds.dart';
import 'circularButton.dart';


var paypalkey = GlobalKey<FormState>();
var mastercardkey = GlobalKey<FormState>();
class Master_Card extends StatelessWidget {
  const Master_Card({
    super.key,
    required this.width,
    required this.height,
    required this.ctrl,
  });

  final double width;
  final double height;
  final LoginController ctrl ;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    TextEditingController _cardnoctrl = new TextEditingController();
    TextEditingController _emailctrl = new TextEditingController();
    TextEditingController _ccvctrl = new TextEditingController();
    TextEditingController _datectrl = new TextEditingController();

    return Container(
      width: width,
      child: Form(
        key:mastercardkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [

            Container(
              width: width / 1.13,
              child: Input_Feild(
                  text: "Name",
                  icon: Icon(Icons.person),
                  validate:(s)=>ctrl.validatename(s!),
                  isPassword: false,
                  ctrl: _cardnoctrl),
            ),
            SizedBox(
              height: height / 40,
            ),
            Container(
              width: width / 1.13,
              child:  Input_Feild(
                  text: "Email",
                  icon: Icon(Icons.email_outlined),
                  validate:(s) =>
                      ctrl.validateEmail(s!),
                  isPassword: false,
                  ctrl: _emailctrl),
            ),
            SizedBox(
              height: height / 40,
            ),
            Container(
              width: width,
              height: height / 9,
              child: Row(children: [
                SizedBox(
                  width: width / 18,
                ),
                Small_Feilds(width: w,height: h,validate:(s) =>
                    ctrl.validatedate(s!), ctrl: _datectrl,text:"M/Y/D",icon: Icon(Icons.calendar_month_outlined), ),
                SizedBox(
                  width: width / 50,
                ),
                Small_Feilds(width: w,height: h,validate:(s) =>
                    ctrl.validateccv(s!), ctrl: _ccvctrl,text:"CCV" ,icon:Icon(Icons.credit_card)),
              ]),
            ),
            SizedBox(
              height: h / 30,
            ),

            CircularButton(
              ontap: () {
                if(mastercardkey.currentState!.validate())
                {
                }
              },
              heightDivididedBy: 12,
              text: 'Add',
              widthDividedBy: 1.35,
            ),
          ],
        ),
      ),
    );
  }
}


class Paypal extends StatelessWidget {
  const Paypal({
    super.key,
    required this.width,
    required this.height,
    required this.ctrl,
  });

  final double width;
  final double height;
  final LoginController ctrl;

  @override
  Widget build(BuildContext context) {
    TextEditingController _namectrl = new TextEditingController();
    TextEditingController _emailctrl = new TextEditingController();
    return Form(
      key: paypalkey,
      child: Container(
        width: width,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width / 1.13,
                child: Input_Feild(
                    text: "Name",
                    icon: Icon(Icons.person),
                    validate:(s)=>ctrl.validatename(s!),
                    isPassword: false,
                    ctrl: _namectrl),
              ),
              SizedBox(
                height: height / 40,
              ),
              Container(
                width: width / 1.13,
                child:  Input_Feild(
                    text: "Email",
                    icon: Icon(Icons.email_outlined),
                    validate:(s) =>
                        ctrl.validateEmail(s!),
                    isPassword: false,
                    ctrl: _emailctrl),
              ),

              SizedBox(
                height:height/30,
              ),

              CircularButton(
                ontap: () {
                  if(paypalkey.currentState!.validate())
                  {

                  }
                },
                heightDivididedBy: 12,
                text: 'Add',
                widthDividedBy: 1.35,
              ),
            ]),
      ),
    );
  }
}
