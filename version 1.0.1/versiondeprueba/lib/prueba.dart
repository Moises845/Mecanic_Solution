import 'package:flutter/material.dart';
import 'package:versiondeprueba/crearcitas.dart';
import 'Micuanta.dart'; // Asegúrate de que el nombre del archivo sea correcto
import 'paneldecitas.dart';

void main() {
  runApp(const SBottomNavigationBar());
}

class SBottomNavigationBar extends StatefulWidget {
  const SBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _SBottomNavigationBarState createState() => _SBottomNavigationBarState();
}

class _SBottomNavigationBarState extends State<SBottomNavigationBar> {
  int _selectedIndex = 0;

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
        appBar: AppBar(
          title: Text('Mecánicos'),
          backgroundColor: Colors.blue, // Color de fondo de la barra de título
        ),
        body: _selectedIndex == 0
            ? CitasScreen()
            : _buildList(), // Mostrar la lista en lugar de Mi Cuenta
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Citas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Mi Cuenta',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
          backgroundColor:
              Colors.white, // Color de fondo de la barra 3de navegación
        ),
      ),
    );
  }

  Widget _buildListTile(String title, String subtitle, String imagePath) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(imagePath),
                      radius: 30.0,
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: ElevatedButton(
                        onPressed: () {
                          // Agregar lógica para el botón
                        },
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            trailing: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star_half, color: Colors.yellow),
              ],
            ),
            onTap: () {
              // Agregar lógica para manejar el toque en un elemento de la lista.
            },
          ),
          SizedBox(height: 16.0), // Espacio entre el ListTile y el botón
          Container(
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
            alignment: Alignment.bottomLeft,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateAppointmentScreen(),
                  ),
                );
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  _buildList() {}
}
