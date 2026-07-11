import 'package:flutter/material.dart';

import 'package:event_management_app/screens/home/home.screen.dart';
import 'package:event_management_app/screens/features/features_screen.dart';
import 'package:event_management_app/screens/community/community_screen.dart';
import 'package:event_management_app/screens/favourite/favourite_screen.dart';
import 'package:event_management_app/screens/settings/settings_screen.dart';
import 'package:event_management_app/core/widgets/custom_bottom_nav.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    const FeaturesScreen(),
    const CommunityScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}