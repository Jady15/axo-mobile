import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400,
                child: Text("Este será el formulario para que nuestros queridos usuarios inicien sesión en la aplicación", textAlign: TextAlign.center, style: TextStyle(fontSize: 28),), 
              ),
              
              const SizedBox(height: 40),
              Text("¡Gracias por visitar! 👀", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
            ]
          ),
        ),
      ),
    );
  }
}