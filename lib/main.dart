import 'package:axo_app/screens/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:axo_app/screens/login_screen.dart';
import 'package:axo_app/screens/register_screen.dart';
import 'package:axo_app/screens/welcome_screen.dart';
import 'package:axo_app/screens/profile_screen.dart';
import 'package:axo_app/screens/edit_profile_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/layout': (context) => const LayoutScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/edit_profile': (context) => const EditProfileScreen(),

      },
      title: 'AXO',
    );
  }
}

  

