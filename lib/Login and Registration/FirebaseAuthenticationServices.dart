import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future createNewUser(String email, String password) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    return userCredential.user;
  }

  Future userSignIn(String email, String password) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user.uid;
  }
}
