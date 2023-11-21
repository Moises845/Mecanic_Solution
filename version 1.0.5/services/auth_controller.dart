/*
import 'package:crud_mecanicsolution/screens/screenregistro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  AuthController();
  @override
  void onInit(){
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((usuarios) {
      if (usuarios==null) Get.offAllNamed(RouteNames.signIn);

    });
  }
  User? get currentUser => FirebaseAuth.instance.currentUser;

}
*/