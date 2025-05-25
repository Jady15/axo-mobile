import 'package:flutter/material.dart';
import 'package:axo_app/widgets/custom_text_field.dart';
import 'package:axo_app/services/auth_service.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _usernameOrEmailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 120),

                Image.asset(
                  'assets/axo-logo.png',
                  height: 120,
                ),
                const SizedBox(height: 60),

                const Text(
                  'Inicia Sesión',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(13, 73, 139, 1),
                  ),
                ),
                const SizedBox(height: 10),

                Container(
                  width: 300,
                  child: const Text(
                    'Ingresa tus datos para acceder a la plataforma',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        label: 'Correo o nombre de usuario', 
                        controller: _usernameOrEmailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa un correo o nombre de usuario';
                          }

                          // Validación de correo electrónico
                          bool isEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);

                          // Validación de nombre de usuario
                          bool isUsername = value.length >= 3;
                          
                          if (!isEmail && !isUsername) {
                            return 'Ingresa un correo válido o un nombre de usuario válido';
                          }

                          return null;
                        },
                      ),
                      CustomTextField(
                        label: 'Contraseña', 
                        isPassword: true,
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa una contraseña';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () async {
                    if(_formKey.currentState!.validate()) {
                      bool isAuthenticated = await _authService.login(
                        _usernameOrEmailController.text,
                        _passwordController.text,
                      );
                      if (isAuthenticated) {
                        Navigator.pushNamedAndRemoveUntil(
                          context, 
                          '/layout', 
                          (route) => false
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Credenciales incorrectas'),
                            backgroundColor: Colors.red,
                          )
                        );
                      }
                    }
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
                  child: const Text('Ingresar', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '¿No tienes cuenta?',
                      style: TextStyle(fontSize: 20),
                    ),
                    TextButton(
                      onPressed: (){Navigator.pushReplacementNamed(context, '/register');}, 
                      child: const Text(
                        'Regístrate aquí',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ),
                  ],
                ),
                const SizedBox(height: 20),                
              ],
            ),
          )
        )
      )
    );
  }
}
