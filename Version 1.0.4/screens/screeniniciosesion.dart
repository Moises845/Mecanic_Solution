import 'package:crud_mecanicsolution/screens/screenmecanicos.dart';
import 'package:crud_mecanicsolution/screens/screenregistro.dart';
import 'package:crud_mecanicsolution/screens/tabs_screens.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class ScreenInicio extends StatefulWidget {
  const ScreenInicio({super.key});

  @override
  State<ScreenInicio> createState() => _ScreenInicioState();
}

class _ScreenInicioState extends State<ScreenInicio> {
  late String email, password;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        key: _formkey,
        home: Scaffold(body: cuerpo(context)));
  }
}

Widget cuerpo(context) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://w0.peakpx.com/wallpaper/621/579/HD-wallpaper-blue-gradient-rainbow-colourful-green-iphone-ipad-nice-pink-red-samsung-tablet.jpg"),
            fit: BoxFit.cover)),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          logo(),
          nombre(),
          campoUsuario(),
          campoContrasena(context),
          botonEntrar(context),
          botonRegistro(context)
        ],
      ),
    ),
  );
}

Widget logo() {
  return Container(
    alignment: Alignment.center,
    width: 100,
    height: 100,
    child: Image.asset('assets/logo.jpeg'),
  );
}

Widget nombre() {
  return const Text(
    "Iniciar sesion",
    style: TextStyle(
        color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold),
  );
}

Widget campoUsuario() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextField(
        onChanged: (String? value) {
          email = value;
        },
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: "Correo electronico",
          fillColor: Colors.white,
          filled: true,
        )),
  );
}

Widget campoContrasena(context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextField(
        onChanged: (String? value) {
          email = value;
        },
        obscureText: true,
        controller: passwordController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: "Contraseña",
          fillColor: Colors.white,
          filled: true,
        )),
  );
}

Widget botonEntrar(BuildContext context) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SBottomNavigationBar()));
        },
        child: const Text("Iniciar"),
      ));
}

Widget googleSignInButton({required List childrens}) {
  return Container(child: googleSignInButton(childrens: []));
}

Widget botonRegistro(BuildContext context) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Registro()));
        },
        child: const Text(
          "¿No tienes cuenta? Registrate",
          textAlign: TextAlign.right,
        ),
      ));
}
