import 'package:bhaile/constants/AppColors.dart';
import 'package:bhaile/controllers/loginController.dart';
import 'package:bhaile/view/OnBoarding/OnBoardingone.dart';
import 'package:bhaile/view/Signup/Signup_one.dart';
import 'package:bhaile/widgets/Buttons.dart';
import 'package:bhaile/widgets/Texts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/circularButton.dart';
import '../../widgets/myTextField.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  var loginKey = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var loginController = context.read<LoginController>();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/Signup/Loginback.png",
                width: width,
                fit: BoxFit.fill,
                // )
                // ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height / 16,
                  ),

                  Rich_Text(texta: "Let's", textb: " Sign In", size: 20.sp),

                  SizedBox(
                    height: height / 18,
                  ),
                  Padding(
                    padding: EdgeInsets.all(height / 40),
                    child: Column(
                      children: [
                        Form(
                            key: loginKey,
                            child: Column(
                              children: [
                                MyTextField(
                                    ctrl: emailCtrl,
                                    text: "Email",
                                    validate: (s) =>
                                        loginController.validateEmail(s!),
                                    icon: Icon(
                                      Icons.mail_outline,
                                      color: AppColors.PRIMARY_DARK,
                                    )),
                                SizedBox(
                                  height: height / 40,
                                ),
                                Selector<LoginController, bool>(
                                    selector: (context, ctrl) =>
                                        ctrl.showPassword,
                                    builder: (context, showPassword, a) {
                                      return MyTextField(
                                          ctrl: passwordCtrl,
                                          validate: (s) => loginController
                                              .validatePassword(s!),
                                          isPassword: showPassword,
                                          text: "Password",
                                          icon: Icon(
                                            Icons.lock,
                                            color: AppColors.PRIMARY_DARK,
                                          ));
                                    }),
                              ],
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text_Button(
                                text: "Forgot Password?",
                                ontap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              OnBoardingone()));
                                }),
                            Selector<LoginController, bool>(
                                selector: (context, ctrl) => ctrl.showPassword,
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
                                          });
                                }),
                          ],
                        ),
                        SizedBox(
                          height: height / 40,
                        ),
                        CircularButton(
                          ontap: () {
                            if (loginKey.currentState!.validate()) {
                              loginController.login(
                                  context: context,
                                  email: emailCtrl.text,
                                  password: passwordCtrl.text);
                            }
                          },
                          heightDivididedBy: 12,
                          text: 'Login',
                          widthDividedBy: 1.35,
                        ),
                        SizedBox(
                          height: height / 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SimpleText(
                                text: "Don't have an account?",
                                color: Colors.black,
                                size: 12),
                            Text_Button(
                                text: "Register?",
                                ontap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Signup_one()));
                                }),
                          ],
                        ),
                      ],
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
