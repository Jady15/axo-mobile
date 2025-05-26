import 'package:axo_app/widgets/card_table.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final availableHeight = MediaQuery.of(context).size.height
        - kToolbarHeight
        - kBottomNavigationBarHeight
        -30;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: availableHeight),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '¡Bienvenido, usuari@!',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(13, 73, 139, 1),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'Selecciona una acción para comenzar a navegar.',
                    style: TextStyle(fontSize: 20),
                  ),
                  CardTable(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
