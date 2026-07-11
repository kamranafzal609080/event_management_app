import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:event_management_app/core/theme/theme_provider.dart';
import 'package:event_management_app/screens/settings/placeholder_screens.dart';
import 'package:event_management_app/screens/settings/edit_profile_screen.dart';
import 'package:event_management_app/screens/settings/notifications_screen.dart';

import '../auth/login_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Setting",
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.light 
                ? const Color(0xFF555555) 
                : Colors.white70,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Profile Section
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/profile1.png"),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Morgan mill",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.headlineMedium?.color,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "example23@gmail.com",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Edit Profile Button
                  SizedBox(
                    width: 150,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD32F2F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.edit_outlined, color: Colors.white, size: 20),
                          SizedBox(width: 8),
                          Text(
                            "Edit Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Settings Menu
            _buildMenuItem(
              context: context,
              icon: Icons.notifications_none_outlined,
              title: "Notifications",
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationsScreen())),
            ),
            _buildMenuItem(
              context: context,
              icon: Icons.insert_drive_file_outlined,
              title: "Privacy Policy",
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen())),
            ),
            _buildMenuItem(
              context: context,
              icon: Icons.insert_drive_file_outlined,
              title: "Term & Conditions",
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TermsConditionsScreen())),
            ),
            _buildMenuItem(
              context: context,
              icon: Icons.help_outline,
              title: "Help & Support",
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpSupportScreen())),
            ),
            _buildMenuItem(
              context: context,
              icon: Icons.share_outlined,
              title: "Invite Your Friend",
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const InviteFriendScreen())),
            ),
            
            // Dark Mode Toggle Row
            Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.dark_mode_outlined, 
                    size: 24,
                    color: Theme.of(context).brightness == Brightness.light 
                        ? Colors.black54 
                        : Colors.white70,
                  ),
                  title: Text(
                    "Dark Mode",
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                  trailing: Switch(
                    value: themeProvider.isDarkMode,
                    activeColor: const Color(0xFFD32F2F),
                    onChanged: (value) {
                      themeProvider.toggleTheme(value);
                    },
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(height: 1),
                ),
              ],
            ),

            _buildMenuItem(
              context: context,
              icon: Icons.logout,
              title: "Logout",
              isLogout: true,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen())),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    final color = isLogout ? const Color(0xFFD32F2F) : (Theme.of(context).brightness == Brightness.light ? Colors.black54 : Colors.white70);
    final textColor = isLogout ? const Color(0xFFD32F2F) : Theme.of(context).textTheme.bodyLarge?.color;

    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: Icon(
            icon,
            color: color,
            size: 24,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(
            Icons.chevron_right,
            size: 20,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Divider(height: 1),
        ),
      ],
    );
  }
}
