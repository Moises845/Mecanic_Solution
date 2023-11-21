import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_mecanicsolution/screens/screencitas.dart';
import 'package:crud_mecanicsolution/screens/screencuenta.dart';
import 'package:crud_mecanicsolution/screens/screengruas.dart';
import 'package:crud_mecanicsolution/screens/screenmecanicos.dart';
import 'package:flutter/material.dart';


class SBottomNavigationBar extends StatefulWidget {
  const SBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<SBottomNavigationBar> createState() => _SBottomNavigationBarState();
}

class _SBottomNavigationBarState extends State<SBottomNavigationBar> {
  
  int _selectedIndex = 1;

  final List<Widget> _pages = [
     const ScreenCitas(), // 
     const ScreenMecanicos(),
      Screengruas(),
     const Screencuenta(),
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
          BottomNavigationBarItem(icon:  Icon(Icons.calendar_month_outlined), label: "Citas", backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon:  Icon(Icons.search), label: "Buscar", backgroundColor: Colors.brown),
          BottomNavigationBarItem(icon:  Icon(Icons.car_repair_outlined), label: "Remolque", backgroundColor: Colors.green),
          BottomNavigationBarItem(icon:  Icon(Icons.person_pin), label: "Cuenta", backgroundColor: Colors.amber),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 128, 8, 240),
        onTap: _onItemTapped,
      ),
    );
  }
}