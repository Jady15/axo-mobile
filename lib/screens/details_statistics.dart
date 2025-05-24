import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DetailsStatistics extends StatelessWidget {
  final String nombre;
  final String imagen;

  DetailsStatistics({required this.nombre, required this.imagen});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sección de título "Estadísticas"
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Vuelve a la pantalla anterior
                    },
                    child: Icon(Icons.arrow_back, color: Colors.grey[800]),
                  ),
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

              // Info del sistema
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(imagen),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      nombre,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Resumen histórico + botón
              Row(
                children: [
                  Text(
                    "Resumen histórico",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[300],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.calendar_today, size: 16),
                    label: Text("Hoy"),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Tabs
              TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.blue,
                tabs: const [
                  Tab(text: "Temperatura"),
                  Tab(text: "Humedad"),
                  Tab(text: "Consumo"),
                ],
              ),
              SizedBox(height: 10),

              // Contenido de tabs
              Expanded(
                child: TabBarView(
                  children: [
                    _buildTemperatura(),
                    _buildHumedad(),
                    Center(child: Text("Datos de consumo")),
                  ],
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
      ),
    );
  }

  Widget _buildTemperatura() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(children: const [
                    Text("Valor promedio",
                        style: TextStyle(color: Colors.grey)),
                    Text("20 ºC",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ]),
                ),
              ),
            ),
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(children: const [
                    Text("Mínimo", style: TextStyle(color: Colors.grey)),
                    Text("8 ºC"),
                    SizedBox(height: 8),
                    Text("Máximo", style: TextStyle(color: Colors.grey)),
                    Text("30 ºC"),
                  ]),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text("Temperatura interna", style: TextStyle(fontSize: 14)),
                SizedBox(height: 200, child: _buildLineChart()),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHumedad() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(children: const [
                    Text("Valor promedio",
                        style: TextStyle(color: Colors.grey)),
                    Text("80 %",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ]),
                ),
              ),
            ),
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(children: const [
                    Text("Mínimo", style: TextStyle(color: Colors.grey)),
                    Text("50 %"),
                    SizedBox(height: 8),
                    Text("Máximo", style: TextStyle(color: Colors.grey)),
                    Text("90 %"),
                  ]),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text("Humedad interna", style: TextStyle(fontSize: 14)),
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
