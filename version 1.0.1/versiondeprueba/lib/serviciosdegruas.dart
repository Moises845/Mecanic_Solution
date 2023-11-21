import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(serviciosdegruas());
}

class Contacto {
  final String nombre;
  final String telefono;
  final String ciudad;
  final double calificacion;
  final String enlaceWeb;

  Contacto(this.nombre, this.telefono, this.ciudad, this.calificacion,
      this.enlaceWeb);
}

class serviciosdegruas extends StatelessWidget {
  final List<Contacto> contactos = [
    Contacto('Grúas Gonzalez', '5802-9816 Claro', 'Juigalpa', 5.1,
        "https://acortar.link/qtEPJV"),
    Contacto('Grúas F.C.F', '8827-5350 Claro', 'Juigalpa', 4.9,
        "https://wa.link/1akhn6"),
    Contacto('Servicios de Grúas "CORTEZ"', '8615-9480 Claro y 8991-3035 Tigo',
        'Juigalpa y Managua', 5.1, "https://acortar.link/co0hei"),
    Contacto('Gruas Cortez', '8378-4080 Tigo', 'Juigalpa', 4.8,
        "https://wa.link/7q3uc2"),
    Contacto('Gruas Managua  Servicio de Grua para todo Nicaragua', '75178157',
        'Juigalpa-Managua', 5.5, "https://wa.link/vqrleh"),
  ];

  serviciosdegruas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Servcios de Gruas',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 49, 233, 13),
        fontFamily: 'times new roman',
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color.fromARGB(255, 153, 0, 255)),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Contactos de Gruas',
            style: TextStyle(fontSize: 24),
          ),
        ),
        body: ContactList(contactos),
      ),
    );
  }
}

class ContactList extends StatelessWidget {
  final List<Contacto> contactos;

  const ContactList(this.contactos, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contactos.length,
      itemBuilder: (context, index) {
        final contacto = contactos[index];
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetallesContacto(contacto),
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.all(10),
            elevation: 4,
            child: ListTile(
              title: Text(contacto.nombre),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Teléfono: ${contacto.telefono}'),
                  Text('Ciudad: ${contacto.ciudad}'),
                  Text(
                    'Calificación: ${contacto.calificacion.toStringAsFixed(1)}',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 97, 14, 192),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DetallesContacto extends StatelessWidget {
  final Contacto contacto;

  const DetallesContacto(this.contacto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de los servicios de grúas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre del Negocio: ${contacto.nombre}',
                style: const TextStyle(fontSize: 18)),
            Text('Teléfono: ${contacto.telefono}',
                style: const TextStyle(fontSize: 18)),
            Text('Ciudad: ${contacto.ciudad}',
                style: const TextStyle(fontSize: 18)),
            Text('Calificación: ${contacto.calificacion.toStringAsFixed(1)}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16), // Espacio adicional
            const Text('Horario de Servicio:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('Lunes a Domingo 24/7', style: TextStyle(fontSize: 16)),
            const Text('Todos los dias de la semana',
                style: TextStyle(fontSize: 16)),
            const Text('----------------------',
                style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final enlaceWeb = contacto.enlaceWeb;
          if (await canLaunch(enlaceWeb)) {
            await launch(enlaceWeb);
          } else {
            // Manejar el caso en el que no se pueda abrir el enlace web.
          }
        },
        child: const Icon(
          Icons.email, // Icono de correo electrónico
          color: Color.fromARGB(255, 243, 4, 4), // Cambia el color aquí
        ),
      ),
    );
  }
}
