import 'package:flutter/material.dart';

class CustomBGWidget extends StatelessWidget {
  const CustomBGWidget({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
