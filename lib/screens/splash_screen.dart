import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix/screens/landing_page.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedSplashScreen(
      duration: 2000,
      splashIconSize: size.width,
      splash: Lottie.asset(
        'assets/lottie/splash.json',
        frameRate: FrameRate(120),
        repeat: false
      ),
      splashTransition: SplashTransition.fadeTransition,
      nextScreen: LandingPage(),
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: Colors.black,
    );
  }
}