import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _dataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario Flutter'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _dataController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Este campo no puede estar vacío';
                }
                return null;
              },
              decoration: InputDecoration(labelText: 'Datos'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Guardar datos
                  String data = _dataController.text;
                  // Enviar datos al superusuario (simulado)
                  _sendDataToSuperUser(data);
                  // Feedback al usuario
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Datos enviados con éxito'),
                    ),
                  );
                  // Limpia el campo de entrada después de enviar
                  _dataController.clear();
                }
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }

  void _sendDataToSuperUser(String data) {
    // Simular el envío de datos al superusuario (puedes implementar la lógica real aquí).
    print('Enviando datos al superusuario: $data');
  }
}
