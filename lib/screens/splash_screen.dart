import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:news_app/layout/home_screen.dart';

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
      HomeScreen(),
      childWidget: const SizedBox(),
    );
  }
}
