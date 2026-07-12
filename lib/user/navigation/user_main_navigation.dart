import 'package:flutter/material.dart';

import 'package:event_management_app/user/screens/home/home.screen.dart';
import 'package:event_management_app/user/screens/features/features_screen.dart';
import 'package:event_management_app/user/screens/community/community_screen.dart';
import 'package:event_management_app/user/screens/favourite/favourite_screen.dart';
import 'package:event_management_app/user/screens/settings/settings_screen.dart';
import 'package:event_management_app/core/widgets/custom_bottom_nav.dart';

class UserMainNavigation extends StatefulWidget {
  const UserMainNavigation({super.key});

  @override
  State<UserMainNavigation> createState() => _UserMainNavigationState();
}

class _UserMainNavigationState extends State<UserMainNavigation> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
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
