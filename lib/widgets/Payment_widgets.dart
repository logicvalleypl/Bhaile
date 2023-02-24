import 'package:bhaile/widgets/Form_Feilds.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Master_Card extends StatelessWidget {
  const Master_Card({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: width / 1.13,
            child: Input_Feild(
              validate: (a) {},
              ctrl: TextEditingController(),
              text: "Name",
              icon: Icon(Icons.account_circle_sharp),
            ),
          ),
          SizedBox(
            height: height / 100,
          ),
          Container(
            width: width / 1.13,
            child: Input_Feild(
              validate: (a) {},
              ctrl: TextEditingController(),
              text: "Card_no",
              icon: Icon(Icons.credit_card),
            ),
          ),
          SizedBox(
            height: height / 100,
          ),
          Container(
            width: width,
            height: height / 9,
            child: Row(children: [
              SizedBox(
                width: width / 18,
              ),
              Container(
                width: width / 2.3,
                height: height / 2.3,
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    prefixIcon: Icon(Icons.calendar_month_outlined),
                    hintText: "D/M/Y",
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12)),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 23.sp, horizontal: 10.sp),
                  ),
                ),
              ),
              SizedBox(
                width: width / 50,
              ),
              Container(
                width: width / 2.3,
                height: height / 2.3,
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    prefixIcon: Icon(Icons.credit_card),
                    hintText: "CCV",
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12)),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 23.sp, horizontal: 10.sp),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class Paypal extends StatelessWidget {
  const Paypal({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width / 1.13,
              child: Input_Feild(
                validate: (a) {},
                ctrl: TextEditingController(),
                text: "Name",
                icon: Icon(Icons.account_circle_sharp),
              ),
            ),
            SizedBox(
              height: height / 100,
            ),
            Container(
              width: width / 1.13,
              child: Input_Feild(
                validate: (a) {},
                ctrl: TextEditingController(),
                text: "Email",
                icon: Icon(Icons.email_outlined),
              ),
            ),
          ]),
    );
  }
}
