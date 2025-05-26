import 'package:flutter/material.dart';
import 'detailsDashboard.dart';

class DashboardScreen extends StatelessWidget {
  final List<Map<String, String>> dispositivos = [
    {"nombre": "Casa_Carlos", "imagen": "assets/usuario.png", "estado": "Crítico"},
    {"nombre": "Casa_Mau", "imagen": "assets/Mauricio.png", "estado": "Funcionando"},
    {"nombre": "Casa_Isaac", "imagen": "assets/usuario.png", "estado": "Funcionando"},
    {"nombre": "Casa_Brenda", "imagen": "assets/usuario.png", "estado": "Funcionando"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Monitoreo", style: TextStyle(fontSize: 24, color: Color(0xFF0A4C92) ,fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Sistemas registrados", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ElevatedButton(
                    onPressed: () {
                      // Acción para agregar nuevo sistema
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 132, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: const Text("+ Nuevo",style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold,)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text("Selecciona un sistema para visualizar el estado de sus sensores."),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dispositivos.length,
                itemBuilder: (context, index) {
                  final dispositivo = dispositivos[index];
                  final esCritico = dispositivo["estado"] == "Crítico";
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(dispositivo["imagen"]!),
                        radius: 24,
                      ),
                      title: Text(dispositivo["nombre"]!),
                      subtitle: Container(
                        margin: const EdgeInsets.only(top: 4),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: esCritico ? Colors.red[100] : Colors.green[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          dispositivo["estado"]!,
                          style: TextStyle(
                            color: esCritico ? Colors.red : Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailsDashboard(
                              nombre: dispositivo["nombre"]!,
                              imagen: dispositivo["imagen"]!,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
