import 'package:flutter/material.dart';

void main() {
  runApp(Denuncias());
}

class Denuncias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DenunciaScreen(),
    );
  }
}

class DenunciaScreen extends StatefulWidget {
  @override
  _DenunciaScreenState createState() => _DenunciaScreenState();
}

class _DenunciaScreenState extends State<DenunciaScreen> {
  List<Denuncia> denuncias = [
    Denuncia(
      de: "De: Tu Nombre",
      para: "Para: Entidad a la que se dirige la denuncia",
      asunto: "Asunto: Breve descripción del asunto",
      descripcion: "Descripción de la denuncia...",
      fecha: "Fecha: 19 de Octubre de 2023",
      hora: "Hora: 10:30 AM",
    ),
    Denuncia(
      de: "De: Tu Nombre",
      para: "Para: Entidad a la que se dirige la denuncia",
      asunto: "Asunto: Breve descripción del asunto",
      descripcion: "Descripción de la denuncia...",
      fecha: "Fecha: 19 de Octubre de 2023",
      hora: "Hora: 10:30 AM",
    ),
    Denuncia(
      de: "De: Tu Nombre",
      para: "Para: Entidad a la que se dirige la denuncia",
      asunto: "Asunto: Breve descripción del asunto",
      descripcion: "Descripción de la denuncia...",
      fecha: "Fecha: 19 de Octubre de 2023",
      hora: "Hora: 10:30 AM",
    ),
    Denuncia(
      de: "De: Tu Nombre",
      para: "Para: Entidad a la que se dirige la denuncia",
      asunto: "Asunto: Breve descripción del asunto",
      descripcion: "Descripción de la denuncia...",
      fecha: "Fecha: 19 de Octubre de 2023",
      hora: "Hora: 10:30 AM",
    ),

    Denuncia(
      de: "De: Tu Nombre",
      para: "Para: Entidad a la que se dirige la denuncia",
      asunto: "Asunto: Breve descripción del asunto",
      descripcion: "Descripción de la denuncia...",
      fecha: "Fecha: 19 de Octubre de 2023",
      hora: "Hora: 10:30 AM",
    ),

    // Agrega más denuncias simuladas aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis Denuncias",
            style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w700)),
        backgroundColor: Color.fromARGB(255, 3, 118, 212),
      ),
      backgroundColor: Color.fromARGB(135, 155, 154, 154),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: denuncias.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Color.fromARGB(255, 189, 188,
                        188), // Cambia el color de fondo de la Card a rojo
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(denuncias[index].de),
                          Text(denuncias[index].para),
                          Text(denuncias[index].asunto),
                          Text(denuncias[index].descripcion),
                          Text(denuncias[index].fecha),
                          Text(denuncias[index].hora),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Denuncia {
  final String de;
  final String para;
  final String asunto;
  final String descripcion;
  final String fecha;
  final String hora;

  Denuncia({
    required this.de,
    required this.para,
    required this.asunto,
    required this.descripcion,
    required this.fecha,
    required this.hora,
  });
}
