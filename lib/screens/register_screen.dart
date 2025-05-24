import 'package:axo_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  // Controladores para campos del formulario
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
                const SizedBox(height: 20),

                const Text(
                  'Regístrate',
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
                    '¡Ingresa tus datos y crea una cuenta ahora!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),

                // Formulario
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        label: 'Nombre de usuario', 
                        controller: _usernameController,
                        validator: (value) {
                          if (value == null || value.isEmpty){
                            return 'Por favor, ingresa un nombre de usuario';
                          }
                          return null;
                        }
                      ),
                      CustomTextField(
                        label: 'Correo electrónico', 
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa un correo electrónico';
                          }
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                            return 'Ingresa un correo electrónico válido';
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        label: 'Contraseña', 
                        isPassword: true,
                        controller: _passwordController,
                        validator: (value){
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa una contraseña';
                          }
                          if (value.length < 8) {
                            return 'La contraseña debe tener al menos 8 caracteres';
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        label: 'Confirmar contraseña',
                        isPassword: true, 
                        controller: _confirmPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, confirma tu contraseña';
                          }
                          if (value != _passwordController.text) {
                            return 'Las contraseñas no coinciden';
                          }
                          return null;
                        },
                      ),
                    ],
                  )
                ),
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()) {
                      print("Entradas válidas, luego vemos qué hacemos con esto :D");
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
                  child: const Text('Registrarse', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '¿Ya tienes cuenta?',
                      style: TextStyle(fontSize: 20),
                    ),
                    TextButton(
                      onPressed: (){Navigator.pushReplacementNamed(context, '/login');}, 
                      child: const Text(
                        'Inicia sesión',
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
          ),
        )
      ),
    );
  }
}