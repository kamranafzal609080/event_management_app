import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:event_management_app/core/theme/theme_provider.dart';
import 'package:event_management_app/user/screens/settings/placeholder_screens.dart';
import 'package:event_management_app/user/screens/settings/edit_profile_screen.dart';
import 'package:event_management_app/user/screens/settings/notifications_screen.dart';
import 'package:event_management_app/screens/auth/login_screen.dart';
import 'package:event_management_app/core/constants/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Setting",
          style: TextStyle(
            color: isDark ? Colors.white70 : const Color(0xFF555555),
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
                    backgroundImage: AssetImage("assets/images/proflie1.png"),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Morgan mill",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.headlineMedium?.color,
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
                    color: isDark ? Colors.white70 : Colors.black54,
                  ),
                  title: Text(
                    "Dark Mode",
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.w500,
                      color: theme.textTheme.bodyLarge?.color,
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
              onTap: () => _showLogoutDialog(context),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: isDark ? AppColors.darkCard : Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Are you sure you want to logout?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: isDark ? Colors.white70 : Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isDark ? Colors.white60 : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) => const LoginScreen()),
                              (route) => false,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD32F2F),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            "Logout",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMenuItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final color = isLogout ? const Color(0xFFD32F2F) : (isDark ? Colors.white70 : Colors.black54);
    final textColor = isLogout ? const Color(0xFFD32F2F) : theme.textTheme.bodyLarge?.color;

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
          trailing: Icon(
            Icons.chevron_right,
            size: 20,
            color: isDark ? Colors.white38 : Colors.grey,
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
