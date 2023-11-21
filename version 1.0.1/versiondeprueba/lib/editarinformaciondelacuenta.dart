import 'package:flutter/material.dart';
import 'Micuanta.dart'; // Asegúrate de importar las bibliotecas necesarias.
import 'package:shared_preferences/shared_preferences.dart';

// Define la clase Usuario fuera de la clase PantallaEditarInformacion.
class Usuario {
  String nombreUsuario;
  String correoElectronico;
  String telefono;
  String ubicacion;

  Usuario({
    required this.nombreUsuario,
    required this.correoElectronico,
    required this.telefono,
    required this.ubicacion,
  });
}

class PantallaEditarInformacion extends StatefulWidget {
  @override
  _EstadoPantallaEditarInformacion createState() =>
      _EstadoPantallaEditarInformacion();
}

class _EstadoPantallaEditarInformacion
    extends State<PantallaEditarInformacion> {
  // Define TextEditingController para los campos de texto para controlar sus valores.
  TextEditingController controladorNombreUsuario = TextEditingController();
  TextEditingController controladorCorreo = TextEditingController();
  TextEditingController controladorTelefono = TextEditingController();
  TextEditingController controladorUbicacion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Información de la Cuenta"),
      ),
      backgroundColor: const Color.fromARGB(255, 107, 106, 106),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: controladorNombreUsuario,
              decoration: InputDecoration(labelText: 'Nombre de Usuario'),
            ),
            TextFormField(
              controller: controladorCorreo,
              decoration: InputDecoration(labelText: 'Correo Electrónico'),
            ),
            TextFormField(
              controller: controladorTelefono,
              decoration: InputDecoration(labelText: 'Teléfono'),
            ),
            TextFormField(
              controller: controladorUbicacion,
              decoration: InputDecoration(labelText: 'Ubicación'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Obtén los valores editados desde los controladores.
                String nuevoNombreUsuario = controladorNombreUsuario.text;
                String nuevoCorreo = controladorCorreo.text;
                String nuevoTelefono = controladorTelefono.text;
                String nuevaUbicacion = controladorUbicacion.text;

                // Crea una instancia de Usuario con los valores editados.
                Usuario usuario = Usuario(
                  nombreUsuario: nuevoNombreUsuario,
                  correoElectronico: nuevoCorreo,
                  telefono: nuevoTelefono,
                  ubicacion: nuevaUbicacion,
                );

                // Guarda la información del usuario en SharedPreferences.
                var prefs = await SharedPreferences.getInstance();
                await prefs.setString('nombreUsuario', usuario.nombreUsuario);
                await prefs.setString(
                    'correoElectrónico', usuario.correoElectronico);
                await prefs.setString('telefono', usuario.telefono);
                await prefs.setString('ubicacion', usuario.ubicacion);

                // Muestra un mensaje de éxito o realiza alguna otra acción.
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Información actualizada con éxito'),
                ));
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(
                    255, 64, 64, 65), // Cambia el color de fondo del botón
                textStyle: TextStyle(
                  color: const Color.fromARGB(
                      255, 5, 5, 5), // Cambia el color del texto del botón
                ),
              ),
              child: Text("Guardar"),
            ),
          ],
        ),
      ),
    );
  }
}
