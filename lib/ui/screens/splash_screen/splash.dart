import 'dart:async';

import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_routes.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, AppRoutes.onboarding);
      // Navigator.pushNamed(context, Onboarding.routeName);

      // Navigator.pushNamed(context, Main.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: Stack(
        children: [
          Center(
              child: Image.asset("assets/images/Evently.png", height: 100,width: 700,)),
          Positioned(
            bottom: 20,
              left: 0,
              right: 0,
              child: Image.asset("assets/images/Logo (1).png", height: 100, width: 450,)),
    ],
      ),
    );
  }
}
