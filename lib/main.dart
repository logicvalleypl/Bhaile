import 'package:bhaile/controllers/bottomNavigationBarCtrl.dart';
import 'package:bhaile/controllers/payment_provider.dart';
import 'package:bhaile/controllers/registrationController.dart';
import 'package:bhaile/view/Splash/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'controllers/homeScreenController.dart';
import 'controllers/loginController.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => MyProvider()),
      ChangeNotifierProvider(create: (_) => BottomNavigationBarCtrl()),
      ChangeNotifierProvider(create: (_) => LoginController()),
      ChangeNotifierProvider(create: (_) => RegisterationController()),
      ChangeNotifierProvider(create: (_) => HomeScreenController()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (c, v, d) => MaterialApp(
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
  Widget build(BuildContext context) {
    return SplashScreen();
    // return Location_one();

    // return BottomNavigationBarScreen();
  }
}
