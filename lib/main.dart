import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytravel/screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screen.dart';

bool show = true;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefer = await SharedPreferences.getInstance();
  show = prefer.getBool('ON_BOARDING') ?? true; 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.lexendTextTheme()),
      title: 'My Travel 1.0',
      home: show ? const OnboardingScreen() : const HomeScreen(),  // Add parentheses here
    );
  }
}
