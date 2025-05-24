import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                child: Text("Este será el formulario para registrar a nuestros queridos usuarios", textAlign: TextAlign.center, style: TextStyle(fontSize: 28),), 
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