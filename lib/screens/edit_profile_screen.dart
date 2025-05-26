import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: 'Mauricio Eduardo Fragoso Amador');
    final emailController = TextEditingController(text: 'mauriciofragoso@gmail.com');
    final phoneController = TextEditingController(text: '624-666-6666');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.black26,
                  backgroundImage: AssetImage('assets/usuario.png'),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre completo',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Teléfono',
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
            // Obtener datos actualizados
            final updatedName = nameController.text;
            final updatedEmail = emailController.text;
            final updatedPhone = phoneController.text;

            Navigator.pop(context, {
              'name': updatedName,
              'email': updatedEmail,
              'phone': updatedPhone,
            });
          },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[900]),
              child: const Text('Actualizar'),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                // Cancelar y regresar al perfil sin guardar cambios
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.red),
              ),
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
