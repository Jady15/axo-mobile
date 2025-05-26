import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DetailsDashboard extends StatelessWidget {
  final String nombre;
  final String imagen;

  const DetailsDashboard({super.key, required this.nombre, required this.imagen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles de $nombre"),
        backgroundColor: const Color(0xFF0A4C92),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabecera con imagen y nombre
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(imagen),
                  radius: 30,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    nombre,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Tabs para diferentes métricas
            const TabBarContent(),
          ],
        ),
      ),
    );
  }
}

class TabBarContent extends StatelessWidget {
  const TabBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blue,
              tabs: [
                Tab(text: "Temperatura"),
                Tab(text: "Humedad"),
                Tab(text: "Energía"),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: TabBarView(
                children: [
                  _buildChartTab("Temperatura Interna", "22 ºC", "8 ºC", "32 ºC"),
                  _buildChartTab("Humedad Interna", "70 %", "50 %", "90 %"),
                  _buildChartTab("Energía", "150 W", "100 W", "200 W"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartTab(String titulo, String promedio, String min, String max) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Card(
                child: ListTile(
                  title: const Text("Promedio"),
                  subtitle: Text(promedio),
                ),
              ),
            ),
            Expanded(
              child: Card(
                child: ListTile(
                  title: const Text("Mín - Máx"),
                  subtitle: Text("$min / $max"),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(titulo, style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 200, child: SampleLineChart()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SampleLineChart extends StatelessWidget {
  const SampleLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 20),
              FlSpot(1, 30),
              FlSpot(2, 40),
              FlSpot(3, 25),
              FlSpot(4, 35),
            ],
            isCurved: true,
            color: Colors.teal,
            barWidth: 2,
            belowBarData: BarAreaData(show: true, color: Colors.teal.withOpacity(0.3)),
            dotData: FlDotData(show: true),
          ),
        ],
      ),
    );
  }
}
