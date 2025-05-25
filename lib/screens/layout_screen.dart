import 'package:flutter/material.dart';
import 'package:axo_app/screens/statistics_screen.dart';

// Clase para definir la configuración de cada pestaña (sin Navigator)
class NavigationTab {
  final Widget screen;
  final String label;
  final IconData icon;

  const NavigationTab({
    required this.screen,
    required this.label,
    required this.icon,
  });
}

class LayoutScreen extends StatefulWidget {
  final int initialIndex;

  const LayoutScreen({super.key, this.initialIndex = 0});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  late int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  // Lista de pestañas simplificada
  static final List<NavigationTab> _tabs = [
    NavigationTab(
      screen: Center(child: Text('Inicio', style: TextStyle(fontSize: 40))),
      label: 'Home',
      icon: Icons.home,
    ),
    NavigationTab(
      screen: Center(child: Text('Dashboard', style: TextStyle(fontSize: 40))),
      label: 'Dashboard',
      icon: Icons.devices,
    ),
    NavigationTab(
      screen: EstadisticasScreen(),
      label: 'Estadísticas',
      icon: Icons.bar_chart,
    ),
    NavigationTab(
      screen: Center(child: Text('Perfil', style: TextStyle(fontSize: 40))),
      label: 'Perfil',
      icon: Icons.person_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A4C92), // Azul oscuro
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
            const Icon(Icons.account_circle, color: Colors.white, size: 40),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _tabs.map((tab) => tab.screen).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFE4E4E4),
        selectedItemColor: const Color.fromRGBO(79, 149, 207, 1),
        unselectedItemColor: const Color.fromRGBO(114, 114, 114, 1),
        selectedLabelStyle: const TextStyle(
          color: Color.fromRGBO(79, 149, 207, 1),
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Color.fromRGBO(114, 114, 114, 1),
          fontSize: 14,
        ),
        showUnselectedLabels: true,
        iconSize: 48,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: _tabs
            .map((tab) => BottomNavigationBarItem(
                  icon: Icon(tab.icon),
                  label: tab.label,
                ))
            .toList(),
      ),
    );
  }
}