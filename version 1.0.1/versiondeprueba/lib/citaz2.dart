import 'package:flutter/material.dart';
import 'citaz.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => CreateAppointmentScreen(),
          '/misCitas': (context) => MisCitasScreen(),
        },
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 110, 110, 110),
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Color.fromARGB(255, 8, 1, 1),
            ),
          ),
        ),
      ),
    );
//Punto de entrada de la aplicación (main):
// El método main inicia la aplicación llamando a
// runApp con una instancia de la clase MisCitasApp.
//Esta es la raíz de la aplicación.

//MisCitasApp: Esta clase es un widget StatelessWidget
// que representa la aplicación en sí.
//Configura la apariencia y el enrutamiento de la aplicación.
//Definimos las rutas de navegación, el tema de la aplicación y desactivamos
// el banner de modo de depuración.
