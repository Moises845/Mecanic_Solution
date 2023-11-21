import 'package:flutter/material.dart';

void main() {
  runApp(const PanelDeCitas());
}

class PanelDeCitas extends StatelessWidget {
  const PanelDeCitas({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CitasScreen(),
    );
  }
}

class CitasScreen extends StatefulWidget {
  const CitasScreen({super.key});

  @override
  _CitasScreenState createState() => _CitasScreenState();
}

class _CitasScreenState extends State<CitasScreen> {
  List<CitaMecanica> citas = [
    CitaMecanica(
      mecanico: 'Orlando Mendoza',
      cliente: 'Thomas Urtado',
      direccion: 'De la pali 5 cuadras 1/2 al sur',
      descripcion: 'Cambio de aceita',
      id: 1,
      fecha: '26 de octubre del 2023',
      hora: '11:30 AM',
      confirmada: true,
    ),
    CitaMecanica(
      mecanico: 'Warner Casablanca',
      cliente: 'Osmar de Jesus Santillo',
      direccion: 'Carretera la libertad kilometro 12',
      descripcion: 'Calibracion del Volante',
      id: 2,
      fecha: '29 de Noviembre',
      hora: '12:30 PM',
      confirmada: true,
    ),
    CitaMecanica(
      mecanico: 'Jeysonh Tellez',
      cliente: 'Osmar Josue Perez',
      direccion: 'carretera managua',
      descripcion: 'Llantas en mal estado',
      id: 3,
      fecha: '29 de Noviembre',
      hora: '5:30 PM',
      confirmada: true,
    ),
    CitaMecanica(
      mecanico: 'Carry Ortega Gonzales',
      cliente: 'Miguel Cordoba',
      direccion: 'Calle Xolotlan',
      descripcion: 'Calibracion del Volante',
      id: 4,
      fecha: '29 de Noviembre',
      hora: '4:30 PM',
      confirmada: true,
    ),
    CitaMecanica(
      mecanico: 'Alex Mantiel',
      cliente: 'Homero sinsomp',
      direccion: 'Calle Coco',
      descripcion: 'Calibracion del Volante',
      id: 5,
      fecha: '30 de Noviembre',
      hora: '12:30 PM',
      confirmada: true,
    ),
    // Agrega más citas según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Panel de citas",
          style: TextStyle(
            color: Color.fromARGB(
                255, 0, 0, 0), // Cambia el color del texto en el AppBar
          ),
        ),
        backgroundColor: const Color.fromARGB(
            255, 3, 118, 212), // Cambia el color de fondo del AppBar
      ),
      backgroundColor: const Color.fromARGB(
          255, 137, 138, 138), // Cambia el color de fondo de la pantalla
      body: ListView.builder(
        itemCount: citas.length,
        itemBuilder: (context, index) {
          final cita = citas[index];
          return Card(
            color: const Color.fromARGB(255, 241, 243,
                241), // Cambia el color de fondo de la caja (Card) a verde
            child: ListTile(
              title: Text('Mecánico: ${cita.mecanico}\n'
                  'Cliente: ${cita.cliente}\n'
                  'Dirección: ${cita.direccion}\n'
                  'Descripción: ${cita.descripcion}\n'
                  'Fecha: ${cita.fecha}\n'
                  'Hora: ${cita.hora}\n'),
              trailing: Icon(
                cita.confirmada ? Icons.check : Icons.cancel,
                color: cita.confirmada
                    ? const Color.fromARGB(255, 10, 241, 2)
                    : const Color.fromARGB(255, 236, 4, 4),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CitaMecanica {
  int id;
  String fecha;
  String hora;
  bool confirmada;
  String mecanico;
  String cliente;
  String direccion;
  String descripcion;

  CitaMecanica({
    required this.id,
    required this.fecha,
    required this.hora,
    required this.confirmada,
    required this.mecanico,
    required this.cliente,
    required this.direccion,
    required this.descripcion,
  });
}
