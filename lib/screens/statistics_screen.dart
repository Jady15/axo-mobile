import 'package:flutter/material.dart';
import 'details_statistics.dart';

class EstadisticasScreen extends StatelessWidget {
  final List<Map<String, String>> sistemas = [
    {
      'nombre': "Fragoso’s Freezer",
      'estado': "Crítico",
      'imagen': 'assets/Mauricio.png'
    },
    {
      'nombre': "Luviano’s Freezer",
      'estado': "Funcionando",
      'imagen': 'assets/Kirbo.png'
    },
    {
      'nombre': "Ramirez’ Freezer",
      'estado': "Funcionando",
      'imagen': 'assets/usuario.png'
    },
    {
      'nombre': "Ibarra’s Freezer",
      'estado': "Funcionando",
      'imagen': 'assets/usuario.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A4C92), // Azul oscuro de fondo
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              'assets/axo-logo.png', // Asegúrate que esté bien declarado en pubspec.yaml
              height: 40,
            ),
            Spacer(),
            Stack(
              children: [
                Icon(Icons.notifications, color: Colors.white, size: 28),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16),
            Icon(Icons.account_circle, color: Colors.white, size: 30),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sección del título "Estadísticas"
            Row(
              children: [
                Icon(Icons.arrow_back, color: Colors.grey[800]),
                SizedBox(width: 8),
                Text(
                  "Estadísticas",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Sección de texto informativo
            Text(
              "Sistemas registrados",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "Selecciona un sistema para visualizar el resumen de su actividad.",
            ),
            SizedBox(height: 15),

            // Lista de sistemas
            Expanded(
              child: ListView.builder(
                itemCount: sistemas.length,
                itemBuilder: (context, index) {
                  final sistema = sistemas[index];
                  final isCritico = sistema['estado'] == "Crítico";
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(sistema['imagen']!),
                      ),
                      title: Text(sistema['nombre']!),
                      subtitle: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: isCritico
                                ? Colors.yellow[100]
                                : Colors.green[100],
                            border: Border.all(
                              color: isCritico
                                  ? Colors.yellow[700]!
                                  : Colors.green[700]!,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            sistema['estado']!,
                            style: TextStyle(
                              color: isCritico
                                  ? Colors.yellow[800]
                                  : Colors.green[900],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsStatistics(
                              nombre: sistema['nombre']!,
                              imagen: sistema['imagen']!,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.devices), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ''),
        ],
      ),
    );
  }
}
