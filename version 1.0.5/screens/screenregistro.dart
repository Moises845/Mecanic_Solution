import 'package:crud_mecanicsolution/screens/screeniniciosesion.dart';
import 'package:crud_mecanicsolution/services/auth_service.dart';
import 'package:crud_mecanicsolution/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

dynamic password;
dynamic email;

class Usuarios {
  String nombreCompleto;
  String telefono;
  String email;
  String password;
  String ubicacion;
  String cedula;


  Usuarios({
    required this.nombreCompleto,
    required this.telefono,
    required this.email,
    required this.password,
    required this.ubicacion,
    required this.cedula,
  });
}

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  bool _mecanic = false;
  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _nombreCompletoController =TextEditingController(text: "");
  final TextEditingController _telefonoController = TextEditingController(text: "");
  final TextEditingController _emailController = TextEditingController(text: "");
  final TextEditingController _passwordController = TextEditingController(text: "");
  final TextEditingController _ubicacionController = TextEditingController(text: "");
  final TextEditingController _cedulaController = TextEditingController(text: "");
  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _nombreCompletoController.dispose();
    _telefonoController.dispose();
    _ubicacionController.dispose();
    _cedulaController.dispose();
    super.dispose();
  }

  final List<Usuarios> clients = [];

  void registerClient(context) async {
    
    final usuario = Usuarios(
      nombreCompleto: _nombreCompletoController.text,
      telefono: _telefonoController.text,
      email: _emailController.text,
      password: _passwordController.text,
      ubicacion: _ubicacionController.text,
      cedula: _cedulaController.text,

      
    );
    User? user =await _auth.signUpWithEmailAndPassword(email, password);

    if(user!=null){
      print("Usuario fue creado con exito");
      Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ScreenInicio()));
    }

    setState(() {
      clients.add(usuario);
    });

    // Aquí puedes realizar acciones adicionales, como guardar en una base de datos.

    // Limpiar los campos del formulario después de registrar.
    _nombreCompletoController.clear();
    _telefonoController.clear();
    _emailController.clear();
    _passwordController.clear();
    _ubicacionController.clear();
    _cedulaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Registro'),
          ),
          body: fomulario(context)),
    );
  }
  //Guardar informacion en la base de datos
Future<void> addUsuarios(String nombreCompleto, String email, String telefono, String ubicacion, String cedula) async{
  await db.collection("usuarios").add({"nombreCompleto": nombreCompleto, "email":email, "telefono":telefono, "ubicacion":ubicacion, "cedula": cedula});
}

  Widget fomulario(context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Correo Electrónico'),
          TextField(
              controller: _emailController,
              onChanged: (value) {
                setState(
                  () => email = value,
                );
              }),
          const SizedBox(height: 10),
          const Text('Contraseña'),
          TextField(onChanged: (value) {
            setState(
              () => password = value,
            );
          }),
          const SizedBox(height: 10),
          const Text('Nombre completo '),
          TextField(controller: _nombreCompletoController),
          const SizedBox(height: 10),
          const Text('Teléfono'),
          TextField(controller: _telefonoController),
          const SizedBox(height: 10),
          const Text('Ubicación'),
          TextField(controller: _ubicacionController),
          const SizedBox(height: 10),
          const Text('Cédula'),
          TextField(controller: _cedulaController),
          const SizedBox(height: 20),
          SwitchListTile(
            title: const Text("¿Eres mecanico?"),
            value: _mecanic,
            onChanged: (bool value){
              setState(() {
                _mecanic = value;
                if(_mecanic == false){
                  print('Falso');
                  return;
                }else{
                  const Text("Es mecanico");
                  print('Verdadero');
                  
                }
              });
            }, secondary: const Icon(Icons.miscellaneous_services),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              print(_nombreCompletoController.text);
              await addUsuarios(
                _nombreCompletoController.text,
                  _emailController.text,
                  _telefonoController.text,
                  _ubicacionController.text,
                  _cedulaController.text
                  
              ).then((_) =>{
                Navigator.pop(context)
              });
              FirebaseAuthService auth = FirebaseAuthService();
              UserCredential credential = await auth.register(email, password);
              if (credential.user != null) {
                print("Usuario registrado");
              } else {
                print("Usuario no registrado");
              }
              
            },
            child: const Text('Registrar'),
          ),
        ],
      ),
    );
  }
}
