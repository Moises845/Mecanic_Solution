import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController ubicacionController = TextEditingController();

  @override
  void dispose() {
    descripcionController.dispose();
    ubicacionController.dispose();
    super.dispose();
  }

  void _enviarDenuncia() {
    if (_formKey.currentState!.validate()) {
      // Realiza el envío de la denuncia aquí
      final descripcion = descripcionController.text;
      final ubicacion = ubicacionController.text;
      // Simplemente imprime los datos en este ejemplo.
      print("Descripción: $descripcion");
      print("Ubicación: $ubicacion");
      // En una aplicación real, enviarías estos datos a tu servidor o sistema.

      // Limpia los campos después de enviar
      descripcionController.clear();
      ubicacionController.clear();

      // Puedes proporcionar feedback visual al usuario aquí
      showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context)
                .pop(); // Cierra el cuadro de diálogo después de 2 segundos
          });
          return AlertDialog(
            title: Text('Denuncia enviada'),
            content: Text('Gracias por tu denuncia.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Realizar Denuncia"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: descripcionController,
                decoration:
                    InputDecoration(labelText: 'Descripción de la denuncia'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa una descripción.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: ubicacionController,
                decoration: InputDecoration(labelText: 'Ubicación'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _enviarDenuncia,
                child: Text("Enviar Denuncia"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
