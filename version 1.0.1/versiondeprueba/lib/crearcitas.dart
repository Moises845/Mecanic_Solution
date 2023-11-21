import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(crearcita());
}

class crearcita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreateAppointmentScreen(),
    );
  }
}

class CreateAppointmentScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Cita'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nombre del Cliente'),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Dirección'),
            ),
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: 'Cédula'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Descripción del Trabajo'),
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(labelText: 'Fecha'),
            ),
            TextField(
              controller: timeController,
              decoration: InputDecoration(labelText: 'Hora'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String name = nameController.text;
                String address = addressController.text;
                String id = idController.text;
                String description = descriptionController.text;
                String date = dateController.text;
                String time = timeController.text;

                String message = 'Cita para: $name\n'
                    'Dirección: $address\n'
                    'Cédula: $id\n'
                    'Descripción del Trabajo: $description\n'
                    'Fecha: $date\n'
                    'Hora: $time';

                String url =
                    'https://wa.me/?text=${Uri.encodeComponent(message)}';
                await canLaunch(url)
                    ? launch(url)
                    : print('No se pudo abrir WhatsApp');
              },
              child: Text('Realizar la Cita y Enviar por WhatsApp'),
            ),
          ],
        ),
      ),
    );
  }
}
