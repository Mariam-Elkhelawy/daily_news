import 'package:Khabar/layout/home_screen.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      duration: const Duration(seconds: 4),
      backgroundImage:  const Image(
        image: AssetImage('assets/images/splash.png'),
      ),
      nextScreen:
      const HomeScreen(),
      childWidget: const SizedBox(),
    );
  }
}
