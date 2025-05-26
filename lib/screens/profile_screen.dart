import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _alertaTemperatura = false;
  bool _alertaPuerta = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Perfil",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),  
            // Perfil y botón editar
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/usuario.png'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Mauricio Fragoso',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      const Text('mauriciofragoso@gmail.com'),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    Navigator.pushNamed(context, '/edit_profile');
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Gestión de refrigeradores',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            ListTile(
              leading: const Icon(Icons.add_circle_outline),
              title: const Text('Agregar sistema'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit_outlined),
              title: const Text('Editar datos de sistema'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text('Eliminar sistema', style: TextStyle(color: Colors.red)),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Lógica para eliminar sistema
              },
            ),

            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Preferencias',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SwitchListTile(
              title: const Text('Alertar temperaturas fuera de rango'),
              value: _alertaTemperatura,
              onChanged: (val) {
                setState(() {
                  _alertaTemperatura = val;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Notificación de puerta abierta por tiempo prolongado'),
              value: _alertaPuerta,
              onChanged: (val) {
                setState(() {
                  _alertaPuerta = val;
                });
              },
            ),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Text('Cerrar sesión'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

