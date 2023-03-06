import 'package:bhaile/Constants/AppColors.dart';
import 'package:bhaile/Widgets/Texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/loginController.dart';
import '../../../widgets/Form_Feilds.dart';
import '../../../widgets/circularButton.dart';
import '../../Welcome_Screens/Location_one.dart';
import 'Add_Document.dart';
var profilekey = GlobalKey<FormState>();
class Edit_Profile_Widget extends StatelessWidget {
  const Edit_Profile_Widget({
    super.key,
    required this.h,
    required this.w,
    required this.passwordCtrl,
  });

  final double h;
  final double w;
  final TextEditingController passwordCtrl;

  @override
  Widget build(BuildContext context) {

    var EPController = context.read<LoginController>();
    TextEditingController namectrl = new TextEditingController();
    TextEditingController phonectrl = new TextEditingController();
    TextEditingController emailctrl = new TextEditingController();
    TextEditingController addressctrl = new TextEditingController();
    TextEditingController zipcodectrl = new TextEditingController();
    return Column(
      children: [
        SizedBox(
          height: h / 35,
        ),

        Container(
          width: w/4,
          height: h/8,
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(w/2),
              image: DecorationImage(
                image: AssetImage("assets/Home/sample.png"),
                fit: BoxFit.fill,
              ),

          ),
          child: Align(
              alignment:Alignment.bottomRight,
          child: Container(
            width: w/12,
              height: h/24,
              decoration: BoxDecoration(

                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(w/2),

              ),
              child: Icon(Icons.camera_alt_outlined,color: AppColors.BLACK,))),
        ),

        SizedBox(
          height: h / 60,
        ),
        Padding(
          padding: EdgeInsets.all(w / 60),
          child: SingleChildScrollView(
            child: Form(
              key:profilekey,
              child: Column(
                children: [

               Padding(
                      padding: EdgeInsets.all(w / 40),
                      child: Input_Feild(
                          text: "Name",
                          icon: Icon(Icons.person),
                          validate:(s)=>EPController.validatename(s!),
                          isPassword: false,
                          ctrl: namectrl),
                    ),

                  Padding(
                    padding: EdgeInsets.all(w / 40),
                    child: Input_Feild(
                        text: "Phone",
                        icon: Icon(Icons.phone),
                        validate: (s)=>EPController.validatename(s!),
                        isPassword: false,
                        ctrl: phonectrl),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w / 40),
                    child: Input_Feild(
                        text: "Email",
                        icon: Icon(Icons.email_outlined),
                        validate:(s) =>
                            EPController.validateEmail(s!),
                        isPassword: false,
                        ctrl: emailctrl),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w / 40),
                    child: Input_Feild(
                        text: "Address",
                        icon: Icon(Icons.location_on_sharp),
                        validate: (s) =>
                            EPController.validatePassword(s!),
                        isPassword: false,
                        ctrl: passwordCtrl),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w / 40),
                    child: Input_Feild(
                        text: "Zip Code",
                        icon: Icon(Icons.code),
                        validate: (String? a) {},
                        isPassword: false,
                        ctrl: passwordCtrl),
                  ),
                  Padding(
                    padding: EdgeInsets.all(w / 40),
                    child: Column(
                      children: [
                        Add_Document(
                            w: w,
                            h: h,
                            text: "Business Card",
                            icon: Icon(
                              Icons.credit_card,
                              color: AppColors.PRIMARY_DARK,
                            )),
                        SizedBox(
                          height: h / 30,
                        ),
                        Add_Document(
                            w: w,
                            h: h,
                            text: "Address Proof",
                            icon: Icon(Icons.location_on_sharp,
                                color: AppColors.PRIMARY_DARK)),
                        SizedBox(
                          height: h / 30,
                        ),
                        Add_Document(
                            w: w,
                            h: h,
                            text: "Business Document",
                            icon: Icon(Icons.document_scanner,
                                color: AppColors.PRIMARY_DARK)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: h / 80,
        ),
        CircularButton(
          ontap: () {

            if(profilekey.currentState!.validate())
              {

              }
          },
          heightDivididedBy: 12,
          text: 'Confirm',
          widthDividedBy: 1.35,
        ),
      ],
    );
  }
}
