import 'dart:async';
import 'package:flutter/material.dart';
import 'package:event_management_app/core/constants/app_images.dart';
import 'package:event_management_app/core/constants/app_colors.dart';
import 'package:event_management_app/screens/onbording/onboarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:event_management_app/screens/auth/login_screen.dart';
import 'package:event_management_app/user/navigation/user_main_navigation.dart';
import 'package:event_management_app/screens/navigation/main_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // Start checking user after the first frame is rendered to ensure UI is visible
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkUser();
    });
  }

  Future<void> _checkUser() async {
    try {
      // Minimum splash duration
      await Future.delayed(const Duration(seconds: 2));

      final prefs = await SharedPreferences.getInstance();
      bool seenOnboarding = prefs.getBool("seenOnboarding") ?? false;

      final user = FirebaseAuth.instance.currentUser;

      if (!mounted) return;

      // 1. Onboarding check
      if (!seenOnboarding) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const OnboardingScreen()),
        );
        return;
      }

      // 2. User not logged in check
      if (user == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
        return;
      }

      // 3. Logged in user: Firestore role check with timeout
      try {
        final doc = await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .get()
            .timeout(const Duration(seconds: 5));

        if (!mounted) return;

        if (!doc.exists) {
          await FirebaseAuth.instance.signOut();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LoginScreen()),
          );
          return;
        }

        final role = doc.data()?["role"];

        if (role == "admin") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const MainNavigation()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const UserMainNavigation()),
          );
        }
      } on TimeoutException {
        debugPrint("Firestore fetch timed out");
        // Fallback to User side if timeout occurs, or handle as needed
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const UserMainNavigation()),
        );
      }
    } catch (e) {
      debugPrint("Splash Logic Error: $e");
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.splashBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.logo,
              width: 180,
              height: 180,
              color: isDark ? AppColors.primary : null,
              // Error builder to prevent hang if image is missing
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.event, size: 100, color: Colors.white);
              },
            ),
            const SizedBox(height: 24),
            CircularProgressIndicator(
              color: isDark ? AppColors.primary : AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
