import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobpod/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<Credentials> get user {
    return _auth.authStateChanges().map((event) => null);
  }

  Credentials _userCredential(User user) {
    return user != null
        ? Credentials(uid: user.uid, name: user.displayName, email: user.email)
        : null;
  }

  //Signin using firebase
  Future signInFirebase(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userCredential(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  //Signup user using firebase
  Future signUpFirebase(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userCredential(user);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
