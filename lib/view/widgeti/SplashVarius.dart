import 'package:flutter/material.dart';
import 'package:varius_intervju_app/utils/boje.dart';

class SplashScreenVarius extends StatelessWidget {
  const SplashScreenVarius({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: splashGradijent,
        ),
        child: Center(
          child: variuslogo,
        ),
      ),
    );
  }
}
