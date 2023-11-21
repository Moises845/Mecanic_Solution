import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CitasScreen(),
    );
  }
}

class CitasScreen extends StatefulWidget {
  @override
  _CitasScreenState createState() => _CitasScreenState();
}

class _CitasScreenState extends State<CitasScreen> {
  List<CitaMecanica> citas = [
    CitaMecanica(
        id: 1, fecha: '29/10/2023', hora: '09:00 AM', confirmada: false),
    CitaMecanica(
        id: 2, fecha: '26/10/2023', hora: '11:30 AM', confirmada: true),

    CitaMecanica(
        id: 1, fecha: '21/10/2023', hora: '03:00 PM', confirmada: false),
    CitaMecanica(
        id: 2, fecha: '12/10/2023', hora: '11:50 AM', confirmada: true),

    CitaMecanica(
        id: 1, fecha: '19/10/2023', hora: '09:00 AM', confirmada: false),
    CitaMecanica(
        id: 2, fecha: '12/10/2023', hora: '04:30 PM', confirmada: true),
    // Agrega más citas según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Citas de Revisión Mecánica"),
      ),
      body: ListView.builder(
        itemCount: citas.length,
        itemBuilder: (context, index) {
          final cita = citas[index];
          return Card(
            child: ListTile(
              title: Text('Fecha: ${cita.fecha}'),
              subtitle: Text('Hora: ${cita.hora}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(cita.confirmada ? 'Confirmada' : 'Denegar'),
                  IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      // Implementa la funcionalidad de cancelación de cita aquí
                      setState(() {
                        cita.confirmada = false;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () {
                      // Implementa la funcionalidad de confirmación de cita aquí
                      setState(() {
                        cita.confirmada = true;
                      });
                    },
                  ),
                ],
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

  CitaMecanica({
    required this.id,
    required this.fecha,
    required this.hora,
    required this.confirmada,
  });
}
