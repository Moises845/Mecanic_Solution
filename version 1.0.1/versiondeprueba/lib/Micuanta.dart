import 'package:flutter/material.dart';
import 'editarinformaciondelacuenta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'apartadodedenuncias.dart';

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

void main() {
  runApp(MiCuenta());
}

class MiCuenta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MiCuentaScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MiCuentaScreen extends StatefulWidget {
  @override
  _MiCuentaScreenState createState() => _MiCuentaScreenState();
}

class _MiCuentaScreenState extends State<MiCuentaScreen> {
  Usuario?
      informacionCuenta; // Variable para almacenar la información de la cuenta

  @override
  void initState() {
    super.initState();
    cargarInformacionCuenta(); // Cargar la información de la cuenta al iniciar la pantalla
  }

//cuenta de usuario..................................................
  void cargarInformacionCuenta() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Obtener la información de la cuenta almacenada en SharedPreferences
    String? nombreUsuario = prefs.getString('nombreUsuario');
    String? correoElectronico = prefs.getString('correoElectronico');
    String? telefono = prefs.getString('telefono');
    String? ubicacion = prefs.getString('ubicacion');

    if (nombreUsuario != null && correoElectronico != null) {
      setState(() {
        informacionCuenta = Usuario(
          nombreUsuario: nombreUsuario,
          correoElectronico: correoElectronico,
          telefono: telefono ?? "",
          ubicacion: ubicacion ?? "",
        );
      });
    }
  }

  void actualizarInformacionCuenta(Usuario usuario) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('nombreUsuario', usuario.nombreUsuario);
    await prefs.setString('correoElectronico', usuario.correoElectronico);
    await prefs.setString('telefono', usuario.telefono);
    await prefs.setString('ubicacion', usuario.ubicacion);

    // Actualizar la información de la cuenta en la pantalla
    setState(() {
      informacionCuenta = usuario;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mi Cuenta",
          style: TextStyle(color: const Color.fromARGB(255, 7, 7, 7)),
        ),
        backgroundColor:
            Color.fromARGB(255, 50, 6, 245), // Cambia el color del AppBar aquí
        actions: [
          IconButton(
            icon: Icon(Icons.warning),
            onPressed: () {
              // Navegar a la pantalla de denuncias
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ApartadoDeDenuncias(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Color.fromARGB(255, 131, 130, 130),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: Card(
                child: ListTile(
                  title: informacionCuenta != null
                      ? Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: CircleAvatar(
                                  radius: 40, // Tamaño del CircleAvatar
                                  child: Image.network(
                                    "https://upload.wikimedia.org/wikipedia/en/thumb/1/1c/Oshi_no_Ko_Volume_1.jpg/220px-Oshi_no_Ko_Volume_1.png",
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.fill,
                                  ),
                                  // Puedes ajustar otras propiedades según tus necesidades
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Información de la cuenta",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      "Nombre de usuario: ${informacionCuenta!.nombreUsuario}"),
                                  Text(
                                      "Correo Electrónico: ${informacionCuenta!.correoElectronico}"),
                                  Text(
                                      "Teléfono: ${informacionCuenta!.telefono}"),
                                  Text(
                                      "Ubicación: ${informacionCuenta!.ubicacion}"),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Text("Información de la cuenta no disponible"),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () async {
                      // Abre la pantalla de edición y espera la información de la cuenta actualizada.
                      final nuevaInformacion = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              PantallaEditarInformacion(informacionCuenta),
                        ),
                      );

                      // Verifica si se recibió información actualizada.
                      if (nuevaInformacion != null) {
                        // Actualiza la información de la cuenta
                        actualizarInformacionCuenta(nuevaInformacion);
                      }
                    },
                  ),
                ),
              ),
            ),
            //cuenta de usuario..................................................

            //estrellas.......................................................
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                List<Widget> _crearEstrellas({required int calificacion}) {
                  return List.generate(calificacion,
                      (_) => Icon(Icons.star, color: Colors.amber))
                    ..addAll(List.generate(5 - calificacion,
                        (_) => Icon(Icons.star_border, color: Colors.amber)));
                }

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Su calificación es"),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star_border, color: Colors.amber),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text("Cerrar"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 121, 120, 120),
                onPrimary: const Color.fromARGB(255, 12, 12, 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text("Ver Mi Calificación"),
            ),
            SizedBox(height: 16),
            //estrellas.......................................................

            //cierre de sesión...........................................
            ElevatedButton(
              onPressed: () {
                // Implementa la funcionalidad de cierre de sesión
                cerrarSesion();
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 121, 120, 120),
                onPrimary: Color.fromARGB(255, 0, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text("Cerrar Sesión"),
            ),
          ],
        ),
      ),
    );
  }

  void cerrarSesion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Eliminar todas las preferencias almacenadas

    // Redirigir a la pantalla de inicio de sesión u otra pantalla principal
    // En este ejemplo, simplemente cerramos la aplicación
    Navigator.of(context).pop();
  }
} //cierre de sesión...........................................

//informacion de usuario......................................
class PantallaEditarInformacion extends StatefulWidget {
  final Usuario? informacionCuenta;

  PantallaEditarInformacion(this.informacionCuenta);

  @override
  _PantallaEditarInformacionState createState() =>
      _PantallaEditarInformacionState();
}

class _PantallaEditarInformacionState extends State<PantallaEditarInformacion> {
  // Define TextEditingController para los campos de texto para controlar sus valores.
  TextEditingController controladorNombreUsuario = TextEditingController();
  TextEditingController controladorCorreo = TextEditingController();
  TextEditingController controladorTelefono = TextEditingController();
  TextEditingController controladorUbicacion = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.informacionCuenta != null) {
      // Prellenar los campos de edición con la información de la cuenta actual
      controladorNombreUsuario.text = widget.informacionCuenta!.nombreUsuario;
      controladorCorreo.text = widget.informacionCuenta!.correoElectronico;
      controladorTelefono.text = widget.informacionCuenta!.telefono;
      controladorUbicacion.text = widget.informacionCuenta!.ubicacion;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Información de la Cuenta"),
      ),
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
                actualizarInformacionCuenta(usuario);

                // Devuelve la información actualizada a la pantalla anterior
                Navigator.of(context).pop(usuario);
              },
              child: Text("Guardar"),
            ),
          ],
        ),
      ),
    );
  }
}

void actualizarInformacionCuenta(Usuario usuario) {}
//informacion de usuario......................................