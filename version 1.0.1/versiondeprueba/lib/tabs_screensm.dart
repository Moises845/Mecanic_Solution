import 'package:flutter/material.dart';
import 'Micuanta.dart';
import 'paneldecitas.dart';

void main() {
  runApp(SBottomNavigationBar());
}

class SBottomNavigationBar extends StatefulWidget {
  const SBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _SBottomNavigationBarState createState() => _SBottomNavigationBarState();
}

class _SBottomNavigationBarState extends State<SBottomNavigationBar> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    CitasScreen(),
    MiCuenta(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Citas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Mi Cuanta',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue, // Color de ícono seleccionado
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
