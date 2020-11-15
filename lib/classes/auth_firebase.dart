import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebase {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> signin(String email, String password) async {
    String value;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      value = userCredential.user.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        value = 'No se ha encontrado ningun usuario con este email.';
        print('No se ha encontrado ningun usuario con este email.');
      } else if (e.code == 'wrong-password') {
        value = 'Contraseña incorrecta para este usuario.';
        print('Contraseña incorrecta para este usuario.');
      }
    }
    return value;
  }

  Future<String> createUser(String email, String password) async {
    String value;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      value = userCredential.user.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        value = 'La constraseña ingresada es demasiado debil.';
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        value = 'Ya existe una cuenta registrada con este correo electronico.';
      }
    } catch (e) {
      print(e);
    }
    return value;
  }

  Future<void> signOut() async {
    return auth.signOut();
  }
}
