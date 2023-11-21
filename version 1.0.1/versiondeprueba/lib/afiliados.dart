import 'package:flutter/material.dart';

void main() => runApp(Afiliados());

class Afiliados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mecánicos Afiliados'),
        ),
        backgroundColor: const Color.fromARGB(255, 95, 95, 95),
        body: AffiliatesList(),
      ),
    );
  }
}

class AffiliatesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AffiliatesProvider provider = AffiliatesProvider();

    return ListView.builder(
      itemCount: provider.getAffiliates().length,
      itemBuilder: (context, index) {
        final affiliate = provider.getAffiliates()[index];
        return Card(
          color: Color.fromARGB(
              255, 241, 243, 241), // Color de fondo de la tarjeta
          child: ListTile(
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Nombre: ${affiliate.nombre} ${affiliate.apellidos}\n'
                        'Nombre de usuario: ${affiliate.nombreUsuario}\n'
                        'Ubicación: ${affiliate.localidad}\n'
                        'Cédula de Identidad: ${affiliate.cedulaIdentidad}\n'
                        'Fecha de Registro: ${affiliate.fechaRegistro}\n' // Agrega la fecha de registro
                        'Hora de Registro: ${affiliate.horaRegistro}\n',
                    style: TextStyle(
                        color: Color.fromARGB(
                            255, 8, 8, 8)), // Color del texto en negro
                  ),
                  TextSpan(
                    text: 'Número de celular: ${affiliate.numeroCelular}\n',
                    style: TextStyle(
                      color: Colors
                          .blue, // Cambia el color del número de celular a azul
                    ),
                  ),
                  TextSpan(
                    text: 'Activo: ${affiliate.estado}',
                    style: TextStyle(
                      color: Colors
                          .green, // Cambia el color del estado "Activo" a verde
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

class Affiliate {
  final String nombre;
  final String apellidos;
  final String nombreUsuario;
  final String localidad;
  final String numeroCelular;
  final String cedulaIdentidad;
  final String estado;
  final String fechaRegistro;
  final String horaRegistro;

  Affiliate({
    required this.nombre,
    required this.apellidos,
    required this.nombreUsuario,
    required this.localidad,
    required this.numeroCelular,
    required this.cedulaIdentidad,
    required this.estado,
    required this.fechaRegistro,
    required this.horaRegistro,
  });
}

class AffiliatesProvider {
  final List<Affiliate> affiliates = [
    Affiliate(
      nombre: 'Juan',
      apellidos: 'Pérez Gómez',
      nombreUsuario: 'juangomez',
      localidad: 'Ciudad A',
      numeroCelular: '123-456-789',
      cedulaIdentidad: '1234567890',
      estado: 'Activo',
      fechaRegistro: '2023-10-19',
      horaRegistro: '12:30 PM',
    ),
    Affiliate(
      nombre: 'María',
      apellidos: 'López Rodríguez',
      nombreUsuario: 'marialopez',
      localidad: 'Ciudad B',
      numeroCelular: '987-654-321',
      cedulaIdentidad: '9876543210',
      estado: 'Activo',
      fechaRegistro: '2023-10-20',
      horaRegistro: '11:45 AM',
    ),
    // Agrega más afiliados con sus detalles aquí
  ];

  List<Affiliate> getAffiliates() {
    return affiliates;
  }
}
