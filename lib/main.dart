import 'package:flutter/material.dart';
import 'package:axo_app/screens/login_screen.dart';
import 'package:axo_app/screens/register_screen.dart';
import 'package:axo_app/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen()
      },
      title: 'AXO',
    );
  }
}

  

