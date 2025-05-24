import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60,),
              Image.asset(
                'assets/axo-logo.png',
                height: 180,
              ),
              const SizedBox(height: 30),

              const Text(
                '¡Bienvenido!',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(13, 73, 139, 1),
                ),
              ),
              const SizedBox(height: 20),

               Container(
                width: 250,
                child: Text(
                'Crea una cuenta para ingresar a la plataforma',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              )

              
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/register');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 15,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 24,
                  ),
                  backgroundColor: Color.fromRGBO(13, 73, 139, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                ), 
                child: const Text('Registrarse', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.bold),),
              ),
              const SizedBox(height: 40),

              const Text(
                'ó',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 30),

              const Text(
                '¿Ya tienes cuenta?',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 15,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 24,
                  ),
                  backgroundColor: Color.fromRGBO(13, 73, 139, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                ), 
                child: const Text('Iniciar Sesión', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.bold),))
              
            ],
          )
        )
      ),
    );
  }
}