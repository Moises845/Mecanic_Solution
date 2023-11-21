import 'dart:io';

import 'package:crud_mecanicsolution/services/select_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Screencuenta extends StatefulWidget {
  const Screencuenta({Key? key}) : super(key: key);

  @override
  State<Screencuenta> createState() => _ScreencuentaState();
}

class _ScreencuentaState extends State<Screencuenta> {
  File? image_to_upload;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  Future<void> UploadImage(File imageFile) async {
    try {
      String imageName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageReference =
          _storage.ref().child('images/$imageName.jpg');
      UploadTask uploadTask = storageReference.putFile(imageFile);
      await uploadTask.whenComplete(() => print('Imagen subida con exito'));
    } catch (e) {
      print('Error al subir la imagen: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Text('Mi cuenta'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: SizedBox(
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    onPressed: () async {
                      final imagen = await getImage();
                      setState(() {
                        image_to_upload = File(imagen!.path);
                      });
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  const SizedBox(height: 15.0),
                  image_to_upload != null
                      ? Image.file(image_to_upload!)
                      : const CircleAvatar(
                        backgroundImage: AssetImage('assets/perfil.png'),
                        radius: 65,
                      ),
                  const SizedBox(
                      height:
                          10.0), // Añade un espacio entre el CircleAvatar y el texto
                  const Text(
                    "Información de la cuenta",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: const UserDataItem(
                        label: "Nombre de Usuario",
                        value: "Jose Emilio Barrera"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: const UserDataItem(
                        label: "Teléfono", value: "+505 87314566"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: const UserDataItem(
                        label: "Correo Electrónico",
                        value: "josebarrera555@gmail.com"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: const UserDataItem(
                        label: "Ubicación", value: "Juigalpa, Chontales"),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Agrega aquí la lógica para cerrar la sesión del usuario
                      // Por ejemplo, puedes mostrar un diálogo de confirmación y luego redirigir al usuario a la pantalla de inicio de sesión.
                    },
                    child: const Text("Cerrar Sesión"),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

class UserDataItem extends StatelessWidget {
  final String label;
  final String value;

  const UserDataItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
