import 'package:crud_mecanicsolution/screens/citaz.dart';
import 'package:flutter/material.dart';

class ScreenMecanicos extends StatefulWidget {
  const ScreenMecanicos({Key? key}) : super(key: key);

  @override
  State<ScreenMecanicos> createState() => _ScreenMecanicosState();
}

class _ScreenMecanicosState extends State<ScreenMecanicos> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Text('Mecanicos'),
      ),
      body: listaMecanicos(),
    ));
  }

  Widget listaMecanicos() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4.0,
          margin: const EdgeInsets.all(1),
          child: Column(
            children: [
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/perfil.png'),
                  radius: 30.0,
                ),
                title: const Text(
                  'Raul Perez',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Edad: 25'),
                    Text('Ubicación: Juigalpa'),
                    Text('Número: +505 88645670'),
                    
                      
                  ],
                ),
                trailing: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star_half, color: Colors.yellow),
                  ],
                ),
                onTap: () {
                  // Agregar lógica para manejar el toque en un elemento de la lista.
                },
              ),
              const SizedBox(
                  height: 16.0), // Espacio entre el ListTile y el botón

              Container(
                padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                alignment: Alignment.bottomLeft,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  CreateAppointmentScreen()));
                  },
                  child: const Icon(Icons.add),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
