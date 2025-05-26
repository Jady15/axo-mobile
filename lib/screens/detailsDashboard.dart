import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DetailsDashboard extends StatelessWidget {
  final String nombre;
  final String imagen;

  const DetailsDashboard({
    super.key,
    required this.nombre,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A4C92),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Monitoreo", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título con imagen
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(imagen),
                  radius: 30,
                ),
                const SizedBox(width: 12),
                Text(
                  nombre,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),

            const Text("Información general", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),

            // Cuadros de métricas
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoCard(context, Icons.thermostat, "Temperatura", "20° C"),
                    _buildInfoCard(context, Icons.water_drop, "Humedad", "70%"),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoCard(context, Icons.flash_on, "Consumo energético", "3.5 kWh"),
                    _buildInfoCard(context, Icons.info_outline, "Estado", "Abierto"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Botones tipo chip
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatusChip("Actuador :D", true),
                _buildStatusChip("El otro D:", false),
              ],
            ),
            const SizedBox(height: 20),

            const Text("Gráficas", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 10),

            // Gráficas desplegables
            ExpansionTile(
              title: const Text("Temperatura Congelador"),
              children: const [
                SizedBox(height: 200, child: SampleLineChart(titulo: "TempCon")),
              ],
            ),
            ExpansionTile(
              title: const Text("Temperatura de Refrigerador"),
              children: const [
                SizedBox(height: 200, child: SampleLineChart(titulo: "TempRef")),
              ],
            ),
            ExpansionTile(
              title: const Text("Temperatura Ambiente"),
              children: const [
                SizedBox(height: 200, child: SampleLineChart(titulo: "TempAmb")),
              ],
            ),
            ExpansionTile(
              title: const Text("Humedad Ambiente"),
              children: const [
                SizedBox(height: 200, child: SampleLineChart(titulo: "HumAmb")),
              ],
            ),
            ExpansionTile(
              title: const Text("Energía Consumida"),
              children: const [
                SizedBox(height: 200, child: SampleLineChart(titulo: "EnerCon")),
              ],
            ),
          ],
        ),
      ),

      // Barra de navegación inferior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: const Color(0xFF0A4C92),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.desktop_windows), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ''),
        ],
      ),
    );
  }

Widget _buildInfoCard(BuildContext context, IconData icon, String titulo, String valor) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.45,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.cyan, width: 2),
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(icon, size: 28, color: Colors.cyan),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(valor, style: const TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ],
    ),
  );
}



  Widget _buildStatusChip(String label, bool activo) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: activo ? Colors.teal : Colors.blueGrey,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(label, style: const TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 4),
        Text(
          activo ? "Activo" : "Inactivo",
          style: TextStyle(color: activo ? Colors.green : Colors.red),
        )
      ],
    );
  }
}

class SampleLineChart extends StatelessWidget {
  final String titulo;

  const SampleLineChart({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    final sampleData = [
      FlSpot(0, 10),
      FlSpot(1, 20),
      FlSpot(2, 15),
      FlSpot(3, 25),
      FlSpot(4, 23),
    ];

    return Column(
      children: [
        Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Expanded(
          child: LineChart(
            LineChartData(
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
                leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              borderData: FlBorderData(show: true),
              lineBarsData: [
                LineChartBarData(
                  spots: sampleData,
                  isCurved: true,
                  color: Colors.teal,
                  barWidth: 3,
                  belowBarData: BarAreaData(show: true, color: Colors.teal.withOpacity(0.3)),
                  dotData: FlDotData(show: true),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
