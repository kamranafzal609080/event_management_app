import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:event_management_app/core/theme/light_theme.dart';
import 'package:event_management_app/core/theme/dark_theme.dart';
import 'package:event_management_app/core/theme/theme_provider.dart';
import 'package:event_management_app/screens/splash/splash_screen.dart';

import 'firebase_options.dart';

void main() async {
  // 1. Ensure bindings are initialized first.
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // 2. Initialize SharedPreferences and Firebase in parallel to speed up and avoid single-point hangs.
    final results = await Future.wait([
      SharedPreferences.getInstance(),
      Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
    ]).timeout(const Duration(seconds: 10), onTimeout: () {
      debugPrint("Startup Timeout: Initialization took too long.");
      throw Exception("Initialization Timeout");
    });

    final prefs = results[0] as SharedPreferences;

    runApp(
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(prefs),
        child: const EventManagementApp(),
      ),
    );
  } catch (e) {
    debugPrint("App Startup Error: $e");
    
    // Fallback: Run the app even if initialization fails, allowing UI to show the error
    runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                "Failed to start the app. Please check your internet connection or restart the app.\n\nError: $e",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EventManagementApp extends StatelessWidget {
  const EventManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    // We use watch instead of read/of to stay updated on theme changes
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event Management',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
