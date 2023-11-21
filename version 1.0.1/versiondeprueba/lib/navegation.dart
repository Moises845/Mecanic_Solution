import 'package:flutter/material.dart';
import 'package:versiondeprueba/afiliados.dart';

import 'package:versiondeprueba/citas.dart';

import 'package:versiondeprueba/registro.dart';
import 'package:versiondeprueba/serviciosdegruas.dart';

class SBottomNavigationBar extends StatefulWidget {
  const SBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<SBottomNavigationBar> createState() => _SBottomNavigationBarState();
}

class _SBottomNavigationBarState extends State<SBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    citas(),
    serviciosdegruas(),
    Registro(),
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
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_repair),
            label: 'Servicios de Gruas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Registro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: 'Denuncias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Afiliados',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
