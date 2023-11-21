import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lista de Afiliados'),
        ),
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
        return ListTile(
          title: Text('Nombre: ${affiliate.nombre} ${affiliate.apellidos}'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nombre de usuario: ${affiliate.nombreUsuario}'),
              Text('Localidad: ${affiliate.localidad}'),
              Text('Número de celular: ${affiliate.numeroCelular}'),
              Text('Cédula de Identidad: ${affiliate.cedulaIdentidad}'),
            ],
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

  Affiliate({
    required this.nombre,//
    required this.apellidos,
    required this.nombreUsuario,
    required this.localidad,
    required this.numeroCelular,
    required this.cedulaIdentidad,
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
    ),
    Affiliate(
      nombre: 'María',
      apellidos: 'López Rodríguez',
      nombreUsuario: 'marialopez',
      localidad: 'Ciudad B',
      numeroCelular: '987-654-321',
      cedulaIdentidad: '9876543210',
    ),
    // Agrega más afiliados con sus detalles aquí
  ];

  List<Affiliate> getAffiliates() {
    return affiliates;
  }
}
