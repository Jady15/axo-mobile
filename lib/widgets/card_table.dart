import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  static const Color bgIconColor= Color.fromRGBO(100, 176, 189, 1);

  const CardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
          Table(
          children: [
            TableRow(
              children: [
                //  Text('Columna 1'), Text('Columna 2'), Text('Columna 3')
                _SingleCard(icon: Icons.desktop_windows, color: bgIconColor, text:'Monitoreo'),
                _SingleCard(icon: Icons.bar_chart, color: bgIconColor, text:'Estadísticas'),
              ]
            ),
            TableRow(
              children: [
                //  Text('Columna 1'), Text('Columna 2'), Text('Columna 3')
                _SingleCard(icon: Icons.add_chart, color: bgIconColor, text:'Agregar sistema'),
                _SingleCard(icon: Icons.notification_important_rounded, color: bgIconColor, text:'Historial de alarmas'),
              ]
            ),
            TableRow(
              children: [
                //  Text('Columna 1'), Text('Columna 2'), Text('Columna 3')
                _SingleCard(icon: Icons.person, color: bgIconColor, text:'Perfil'),
                _SingleCard(icon: Icons.info_outline_rounded, color: bgIconColor, text:'Acerca de'),
              ]
            ),
          ],
        ),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  static const Color labelColor = Color.fromRGBO(13, 73, 139, 1);

  const _SingleCard({required this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 180,
      decoration: BoxDecoration(
        color: Color.fromRGBO(244, 244, 244, 1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black,
          width: 1.5,
        )

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          CircleAvatar(
            backgroundColor: color,
            radius: 40,
            child: Icon(icon, color: Colors.white, size: 48,),
          ),
          SizedBox(height: 15,),
          Text(text, style: TextStyle(color: labelColor, fontSize: 22),)
        ]
      ),
    );
  }
}