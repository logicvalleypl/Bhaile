import 'package:bhaile/constants/AppColors.dart';
import 'package:bhaile/controllers/registrationController.dart';
import 'package:bhaile/view/Signup/Authenticate.dart';
import 'package:bhaile/widgets/Buttons.dart';
import 'package:bhaile/widgets/Form_Feilds.dart';
import 'package:bhaile/widgets/Texts.dart';
import 'package:bhaile/widgets/circularButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Signup_one extends StatelessWidget {
  Signup_one({Key? key}) : super(key: key);
  var signUpKey = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var loginController = context.read<RegisterationController>();

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: width / 50, top: width / 50),
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
                    height: height / 13,
                  ),

                  Rich_Text(
                      texta: "Create your", textb: " account", size: 20.sp),

                  SizedBox(
                    height: height / 18,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.sp),
                    child: Form(
                      key: signUpKey,
                      child: Column(
                        children: [
                          Input_Feild(
                              validate: (a) => loginController.validateName(a!),
                              ctrl: nameCtrl,
                              text: "Full name",
                              icon: Icon(
                                Icons.account_circle_outlined,
                                color: AppColors.PRIMARY_DARK,
                              )),
                          SizedBox(
                            height: height / 40,
                          ),
                          Input_Feild(
                              validate: (a) =>
                                  loginController.validateEmail(a!),
                              ctrl: emailCtrl,
                              text: "Email",
                              icon: Icon(
                                Icons.mail_outline,
                                color: AppColors.PRIMARY_DARK,
                              )),
                          SizedBox(
                            height: height / 40,
                          ),
                          Selector<RegisterationController, bool>(
                              selector: (context, ctrl) => ctrl.showPassword,
                              builder: (context, showPassword, a) {
                                return Input_Feild(
                                    ctrl: passwordCtrl,
                                    validate: (s) =>
                                        loginController.validatePassword(s!),
                                    isPassword: showPassword,
                                    text: "Password",
                                    icon: Icon(
                                      Icons.lock,
                                      color: AppColors.PRIMARY_DARK,
                                    ));
                              }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text_Button(
                                  text: "Terms of service", ontap: () {}),
                              Selector<RegisterationController, bool>(
                                  selector: (context, ctrl) =>
                                      ctrl.showPassword,
                                  builder: (context, isPassword, a) {
                                    return isPassword
                                        ? Text_Button(
                                            text: "Show password",
                                            ontap: () {
                                              loginController
                                                  .setShowPassword(false);
                                            })
                                        : Text_Button(
                                            text: "Hide password",
                                            ontap: () {
                                              loginController
                                                  .setShowPassword(true);

                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             OnBoardingone()));
                                            });
                                  }),
                            ],
                          ),
                          SizedBox(
                            height: height / 40,
                          ),
                          CircularButton(
                            ontap: () {
                              if (signUpKey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Authenticate()));
                              }
                            },
                            heightDivididedBy: 12,
                            text: 'Register',
                            widthDividedBy: 1.35,
                          ),
                        ],
                      ),
                    ),
                  ),

                  //TextButton(onPressed: , child: child)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
