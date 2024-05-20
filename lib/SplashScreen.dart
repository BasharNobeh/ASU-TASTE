import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter_application_1/LoginScreen.dart';

class TasteSplashScreen extends StatefulWidget {
  @override
  State<TasteSplashScreen> createState() => _TasteSplashScreenState();
}

class _TasteSplashScreenState extends State<TasteSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      backgroundColor: const Color.fromARGB(255, 218, 64, 74),
      logoWidth: 150,
      loaderColor: Colors.white.withOpacity(0.7),
      logo: Image.asset(
        "lib/images/LogoIconNbg.png",
      ),
      showLoader: true,
      loadingText: Text(
        "Good food, Good Times !",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
      ),
      navigator: LoginScreen(),
      durationInSeconds: 3,
    );
  }
}
