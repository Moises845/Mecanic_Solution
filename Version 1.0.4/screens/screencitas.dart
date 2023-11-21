import 'package:crud_mecanicsolution/screens/citaz.dart';
import 'package:flutter/material.dart';
class ScreenCitas extends StatefulWidget{
  const ScreenCitas ({Key? key}) : super( key : key);

  @override
  State<ScreenCitas> createState() => _ScreenCitasState();
}

class _ScreenCitasState extends State<ScreenCitas> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mis Citas',
          style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 3, 3, 3),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 43, 153, 243),
      ),
      backgroundColor: const Color.fromARGB(255, 138, 138, 137),
      body: citas.isEmpty
          ? const Center(
              child: Text('¡No tiene citas pendientes!',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 66, 66, 66),
                      fontWeight: FontWeight.w500)),
            )
          : ListView.builder(
              itemCount: citas.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Card(
                    color: const Color.fromARGB(255, 204, 204, 202),
                    child: ListTile(
                      title: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_today, // Icono de calendario
                                color: Colors.blue,
                              ),
                              Text(
                                'Mecánico: ${citas[index].nombreMecanico}',
                              ),
                            ],
                          ),
                          Text(
                            'Cita para: ${citas[index].nombreCliente}',
                          ),
                          Text(
                            'Cédula de identidad: ${citas[index].cedula}',
                          ),
                          Text(
                            'Fecha: ${citas[index].fecha}',
                          ),
                          Text(
                            'Hora: ${citas[index].hora}',
                          ),
                          Text(
                            'Descripción: ${citas[index].descripcionTrabajo}',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.delete,
                                    color: Color.fromARGB(255, 48, 11, 46)),
                                onPressed: () {
                                  // Eliminar la cita
                                  setState(() {
                                    citas.removeAt(index);
                                  });
                
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Cita eliminada.'),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

Widget _buildList() {
    // Lista de elementos con títulos y subtítulos
    final List<ListTile> listItems = [
      ListTile(
        title: Text('Título 1'),
        subtitle: Text('Subtítulo 1'),
      ),
      ListTile(
        title: Text('Título 2'),
        subtitle: Text('Subtítulo 2'),
      ),
      ListTile(
        title: Text('Título 3'),
        subtitle: Text('Subtítulo 3'),
      ),
      // Agrega más elementos a la lista según sea necesario
    ];

    return ListView(
      children: listItems,
    );
  }