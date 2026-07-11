import 'dart:async';

import 'package:flutter/material.dart';
import 'package:event_management_app/core/constants/app_colors.dart';
import 'package:event_management_app/core/constants/app_images.dart';
import 'package:event_management_app/screens/onbording/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Image.asset(
          AppImages.logo,
          width: 180,
          height: 180,
        ),
      ),
    );
  }
}