import 'dart:async';

import 'package:bhaile/controllers/bottomNavigationBarCtrl.dart';
import 'package:bhaile/controllers/payment_provider.dart';
import 'package:bhaile/controllers/profileControllers/profileController.dart';
import 'package:bhaile/controllers/registrationController.dart';
import 'package:bhaile/model/agentModel.dart';
import 'package:bhaile/model/landLordModel.dart';
import 'package:bhaile/model/tenantModel.dart';
import 'package:bhaile/services/repos/authRepo.dart';
import 'package:bhaile/view/Splash/SplashScreen.dart';
import 'package:bhaile/view/bottomNavBar/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'controllers/homeScreenController.dart';
import 'controllers/loginController.dart';
import 'controllers/profileControllers/editProfileController.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => MyProvider()),
      ChangeNotifierProvider(create: (_) => BottomNavigationBarCtrl()),
      ChangeNotifierProvider(create: (_) => LoginController()),
      ChangeNotifierProvider(create: (_) => RegisterationController()),
      ChangeNotifierProvider(create: (_) => HomeScreenController()),
      ChangeNotifierProvider(create: (_) => ProfileController()),
      ChangeNotifierProvider(create: (_) => EditProfileController()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (c, v, d) => MaterialApp(
              builder: EasyLoading.init(),
              title: 'Flutter Demo',
              theme: ThemeData(
                fontFamily: "Lato",
                primarySwatch:
                    MaterialColor(Color(0xff234F68).value, <int, Color>{
                  50: Color(0xff234F68).withOpacity(0.1),
                  100: Color(0xff234F68).withOpacity(0.2),
                  200: Color(0xff234F68).withOpacity(0.3),
                  300: Color(0xff234F68).withOpacity(0.4),
                  400: Color(0xff234F68).withOpacity(0.5),
                  500: Color(0xff234F68),
                  600: Color(0xff234F68).withOpacity(0.7),
                  700: Color(0xff234F68).withOpacity(0.8),
                  800: Color(0xff234F68).withOpacity(0.9),
                  900: Color(0xff234F68).withOpacity(1.0),
                }),
              ),
              home: const MyHomePage(),
            ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      var a = await AgentModel.getType();

      if (a == null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => SplashScreen(
                      showLoading: false,
                    )));
      } else {
        if (a == "tenant") {
          var user = await TenantModel.get();
          context.read<ProfileController>().setTenant(user!);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => CheckEmailWidget(
                        token: user.token,
                      )));
        }
        if (a == "landlord") {
          var user = await LandLordModel.get();
          context.read<ProfileController>().setLandLord(user!);

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => CheckEmailWidget(
                        token: user.token,
                      )));
        }
        if (a == "agent") {
          var user = await AgentModel.get();
          context.read<ProfileController>().setAgent(user!);

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => CheckEmailWidget(
                        token: user.token,
                      )));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      showLoading: true,
    );
  }
}

class CheckEmailWidget extends StatelessWidget {
  CheckEmailWidget({
    super.key,
    required this.token,
  });
  var token;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: checkIfTokenIsValid(token ?? "", context),
        builder: (context, data) {
          return data.hasData
              ? data.data!
                  ? BottomNavigationBarScreen()
                  : SplashScreen(
                      showLoading: false,
                    )
              : SplashScreen(
                  showLoading: true,
                );
        });
  }

  Future<bool> checkIfTokenIsValid(String token, BuildContext context) async {
    bool a = await AuthRepo.checkToken(token: token);
    print(token);
    if (!a) {
      SharedPreferences pp = await SharedPreferences.getInstance();
      await pp.clear();
    }
    if (a) {
      context.read<ProfileController>().setUser(token);
    }

    return a;
  }
}
