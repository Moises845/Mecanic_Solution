import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginGoogleUtils {
  static const String TAG = "LoginGoogleUtils";
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      log("$TAG, signInWithGoogle() init...");

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount == null) {
        log("$TAG, signInWithGoogle() - User cancelled the sign-in.");
        return null;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
          await auth.signInWithCredential(credential);
      final User? user = authResult.user;

      if (user != null) {
        log("$TAG, signInWithGoogle() - Sign-in success: ${user.displayName}");
        return user;
      } else {
        log("$TAG, signInWithGoogle() - Sign-in failed.");
        return null;
      }
    } catch (e) {
      log("$TAG, signInWithGoogle() - Error: $e");
      return null;
    }
  }
}
