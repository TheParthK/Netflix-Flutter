import 'package:flutter/material.dart';
import 'package:netflix/screens/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.white,
          selectionColor: Colors.red.withAlpha(100),
          selectionHandleColor: Colors.red,
        ),
        colorScheme: const ColorScheme.dark()
      ),
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      home: LandingPage(),
    );
  }
}