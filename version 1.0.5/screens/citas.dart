import 'package:crud_mecanicsolution/screens/screencitas.dart';
import 'package:flutter/material.dart';
//Importaciones: Se importa el paquete flutter/material,
//que es esencial para el desarrollo de aplicaciones Flutter.

class Citas1 {
  final String nombreMecanico;
  final String nombreCliente;
  final String direccion;
  final String cedula;
  final String descripcionTrabajo;
  final String fecha;
  final String hora;

  Citas1({
    required this.nombreMecanico,
    required this.nombreCliente,
    required this.direccion,
    required this.cedula,
    required this.descripcionTrabajo,
    required this.fecha,
    required this.hora,
  });
  // Cita: Esta clase define un modelo de datos para representar una cita.
  // Contiene propiedades como el nombre del mecánico,
  // nombre del cliente, dirección, cédula,
  // descripción del trabajo, fecha y hora.
  //También incluye métodos aceptarCita y rechazarCita,
  //aunque no están implementados en el código proporcionado.

  void aceptarCita() {}

  void rechazarCita() {}
}

List<Citas1> citas = [];

class CreateAppointmentScreen extends StatelessWidget {
  final TextEditingController nombreMecanicoController =
      TextEditingController();
  final TextEditingController nombreClienteController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();
  final TextEditingController cedulaController = TextEditingController();
  final TextEditingController descripcionTrabajoController =
      TextEditingController();
  final TextEditingController fechaController = TextEditingController();
  final TextEditingController horaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realizar Cita  ',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w900)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 146, 146, 146),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: const Color.fromARGB(255, 121, 120, 120),
                width: 5.0,
              ),
            ),
            child: Column(
              children: [
                TextField(
                  controller: nombreMecanicoController,
                  decoration: const InputDecoration(labelText: 'Nombre del Mecánico'),
                ),
                TextField(
                  controller: nombreClienteController,
                  decoration: const InputDecoration(labelText: 'Nombre del Cliente'),
                ),
                TextField(
                  controller: direccionController,
                  decoration: const InputDecoration(labelText: 'Dirección'),
                ),
                TextField(
                  controller: cedulaController,
                  decoration: const InputDecoration(labelText: 'Cédula'),
                ),
                TextField(
                  controller: descripcionTrabajoController,
                  decoration:
                      const InputDecoration(labelText: 'Descripción del Trabajo'),
                ),
                TextField(
                  controller: fechaController,
                  decoration: const InputDecoration(labelText: 'Fecha'),
                ),
                TextField(
                  controller: horaController,
                  decoration: const InputDecoration(labelText: 'Hora'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (nombreMecanicoController.text.isEmpty ||
                        nombreClienteController.text.isEmpty ||
                        direccionController.text.isEmpty ||
                        cedulaController.text.isEmpty ||
                        descripcionTrabajoController.text.isEmpty ||
                        fechaController.text.isEmpty ||
                        horaController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Por favor, complete todos los campos.'),
                      ));
                    } else {
                      String nombreMecanico = nombreMecanicoController.text;
                      String nombreCliente = nombreClienteController.text;
                      String direccion = direccionController.text;
                      String cedula = cedulaController.text;
                      String descripcionTrabajo =
                          descripcionTrabajoController.text;
                      String fecha = fechaController.text;
                      String hora = horaController.text;
        
                      Citas1 nuevaCita = Citas1(
                        nombreMecanico: nombreMecanico,
                        nombreCliente: nombreCliente,
                        direccion: direccion,
                        cedula: cedula,
                        descripcionTrabajo: descripcionTrabajo,
                        fecha: fecha,
                        hora: hora,
                      );
        
                      citas.add(nuevaCita);
        
                      nombreMecanicoController.clear();
                      nombreClienteController.clear();
                      direccionController.clear();
                      cedulaController.clear();
                      descripcionTrabajoController.clear();
                      fechaController.clear();
                      horaController.clear();
        
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ScreenCitas()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: const Text(
                    'Realizar Cita',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



