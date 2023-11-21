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
        title: Text('Realizar Cita  ',
            style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w900)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 146, 146, 146),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Color.fromARGB(255, 121, 120, 120),
              width: 5.0,
            ),
          ),
          child: Column(
            children: [
              TextField(
                controller: nombreMecanicoController,
                decoration: InputDecoration(labelText: 'Nombre del Mecánico'),
              ),
              TextField(
                controller: nombreClienteController,
                decoration: InputDecoration(labelText: 'Nombre del Cliente'),
              ),
              TextField(
                controller: direccionController,
                decoration: InputDecoration(labelText: 'Dirección'),
              ),
              TextField(
                controller: cedulaController,
                decoration: InputDecoration(labelText: 'Cédula'),
              ),
              TextField(
                controller: descripcionTrabajoController,
                decoration:
                    InputDecoration(labelText: 'Descripción del Trabajo'),
              ),
              TextField(
                controller: fechaController,
                decoration: InputDecoration(labelText: 'Fecha'),
              ),
              TextField(
                controller: horaController,
                decoration: InputDecoration(labelText: 'Hora'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (nombreMecanicoController.text.isEmpty ||
                      nombreClienteController.text.isEmpty ||
                      direccionController.text.isEmpty ||
                      cedulaController.text.isEmpty ||
                      descripcionTrabajoController.text.isEmpty ||
                      fechaController.text.isEmpty ||
                      horaController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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

                    Navigator.pushNamed(context, '/misCitas');
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

              SizedBox(height: 50), // Añade espacio vertical
              ElevatedButton(
                onPressed: () {
                  // Navegar a la pantalla de "Mis Citas"
                  Navigator.pushNamed(context, '/misCitas');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text(
                  'Mis Citas',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//CreateAppointmentScreen: Este widget representa la pantalla para crear una nueva cita.
// Contiene formularios de entrada de texto para recopilar información sobre la cita,
//como el nombre del mecánico, nombre del cliente, etc. Al hacer clic en el botón
//"Realizar Cita", se valida la entrada y se crea una instancia de Cita, que se
// agrega a la lista de citas. Luego, el usuario es redirigido a la pantalla de "Mis Citas".

//segunda pantalla
class MisCitasScreen extends StatefulWidget {
  @override
  _MisCitasScreenState createState() => _MisCitasScreenState();
}

class _MisCitasScreenState extends State<MisCitasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mis Citas',
          style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 3, 3, 3),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 43, 153, 243),
      ),
      backgroundColor: Color.fromARGB(255, 138, 138, 137),
      body: citas.isEmpty
          ? Center(
              child: Text('¡No tiene citas pendientes!',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 66, 66, 66),
                      fontWeight: FontWeight.w500)),
            )
          : ListView.builder(
              itemCount: citas.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Color.fromARGB(255, 204, 204, 202),
                  child: ListTile(
                    title: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today, // Icono de calendario
                              color: Colors.blue,
                            ),
                            Text(
                              'Mecánico: ${citas[index].nombreMecanico}',
                            ),
                          ],
                        ),
                        Text(
                          'Cita para: ${citas[index].nombreCliente}',
                        ),
                        Text(
                          'Cédula de identidad: ${citas[index].cedula}',
                        ),
                        Text(
                          'Fecha: ${citas[index].fecha}',
                        ),
                        Text(
                          'Hora: ${citas[index].hora}',
                        ),
                        Text(
                          'Descripción: ${citas[index].descripcionTrabajo}',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              icon: Icon(Icons.delete,
                                  color: Color.fromARGB(255, 48, 11, 46)),
                              onPressed: () {
                                // Eliminar la cita
                                setState(() {
                                  citas.removeAt(index);
                                });

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Cita eliminada.'),
                                  ),
                                );
                              },
                            ),
                          ],
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
//MisCitasScreen: Este widget muestra la lista de citas.
//Si no hay citas en la lista, muestra un mensaje indicando
//que no hay citas pendientes. Si hay citas en la lista, las
//muestra en una lista desplazable. Cada cita tiene botones
// para aceptar, rechazar o eliminar la cita.
