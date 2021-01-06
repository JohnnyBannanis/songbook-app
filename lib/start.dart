import 'package:flutter/material.dart';
import 'package:cancionero/pages/home.dart';
import 'package:cancionero/pages/index.dart';

void main() {
  runApp(Start());
}

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _currentIndex = 0;//control de indice de vista seleccionada
  final tabs = [Home(), Index()];//listado de vistas

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(//widged para pestañas inferiores
          items: [//iconos y etiqueda para cada elemento de la lista en orden
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Índice',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          backgroundColor: Colors.teal,
          onTap: (index) {//interaccion con el BottomNavigationBar para cambiar el estado de la vista en despliegue al pulsar cada boton
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
