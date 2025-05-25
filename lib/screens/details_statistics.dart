import 'package:axo_app/screens/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DetailsStatistics extends StatelessWidget {
  final String nombre;
  final String imagen;

  const DetailsStatistics({super.key, required this.nombre, required this.imagen});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0A4C92),
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Image.asset(
                'assets/axo-logo.png',
                height: 40,
              ),
              const Spacer(),
              Stack(
                children: [
                  const Icon(Icons.notifications, color: Colors.white, size: 28),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              const Icon(Icons.account_circle, color: Colors.white, size: 30),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título con botón de regreso
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, color: Colors.grey[800]),
                  ),
                  const SizedBox(width: 8),
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
              const SizedBox(height: 20),

              // Imagen y nombre del sistema
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(imagen),
                    radius: 24,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      nombre,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Resumen histórico + botón
              Row(
                children: [
                  const Text(
                    "Resumen histórico",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[300],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.calendar_today, size: 16),
                    label: const Text("Hoy"),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Tabs
              const TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.blue,
                tabs: [
                  Tab(text: "Temperatura"),
                  Tab(text: "Humedad"),
                  Tab(text: "Consumo"),
                ],
              ),
              const SizedBox(height: 10),

              // Contenido por tab
              Expanded(
                child: TabBarView(
                  children: [
                    _buildTabCard("Temperatura interna", "20 ºC", "8 ºC", "30 ºC"),
                    _buildTabCard("Humedad interna", "80 %", "50 %", "90 %"),
                    _buildTabCard("Consumo", "80 %", "80 W", "180 W"),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFFE4E4E4),
          selectedItemColor: const Color.fromRGBO(79, 149, 207, 1),
          unselectedItemColor: const Color.fromRGBO(114, 114, 114, 1),
          selectedLabelStyle: const TextStyle(
            fontSize: 14,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
          ),
          showUnselectedLabels: true,
          iconSize: 48,
          currentIndex: 2, // Estadísticas
          onTap: (index) {
            if (index != 2) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => LayoutScreen(initialIndex: index),
                ),
              );
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.devices), label: 'Dashboard'),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Estadísticas'),
            BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Perfil'),
          ],
        ),
      ),
    );
  }

  Widget _buildTabCard(String title, String promedio, String min, String max) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      const Text("Valor promedio", style: TextStyle(color: Colors.grey)),
                      Text(promedio,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      const Text("Mínimo", style: TextStyle(color: Colors.grey)),
                      Text(min),
                      const SizedBox(height: 8),
                      const Text("Máximo", style: TextStyle(color: Colors.grey)),
                      Text(max),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(title, style: const TextStyle(fontSize: 14)),
                SizedBox(height: 200, child: _buildLineChart()),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLineChart() {
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
        ),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 20),
              FlSpot(1, 40),
              FlSpot(2, 90),
              FlSpot(3, 70),
            ],
            isCurved: true,
            barWidth: 2,
            color: Colors.blue,
            dotData: FlDotData(show: true),
          ),
        ],
      ),
    );
  }
}
