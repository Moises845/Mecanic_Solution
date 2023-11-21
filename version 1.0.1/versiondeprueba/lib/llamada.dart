import 'package:flutter/material.dart';
import 'package:versiondeprueba/afiliados.dart';

import 'package:versiondeprueba/citas.dart';
import 'package:versiondeprueba/crearcitas.dart';

import 'package:versiondeprueba/registro.dart';
import 'package:versiondeprueba/serviciosdegruas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SBottomNavigationBar(),
    );
  }
}

class SBottomNavigationBar extends StatefulWidget {
  const SBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _SBottomNavigationBarState createState() => _SBottomNavigationBarState();
}

class _SBottomNavigationBarState extends State<SBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    // Asegúrate de que los nombres de las clases coincidan
    citas(),
    Registro(),

    serviciosdegruas(),
    crearcita()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Citas',
              backgroundColor: Colors.brown),
          BottomNavigationBarItem(
              icon: Icon(Icons.car_repair),
              label: 'Servicios de Gruas',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Registro',
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.warning),
              label: 'Denuncias',
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Afiliados',
              backgroundColor: Colors.lightBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_view_month_sharp),
              label: 'Crear cita',
              backgroundColor: Colors.lightBlue),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 128, 8, 240),
        onTap: _onItemTapped,
      ),
    );
  }
}
