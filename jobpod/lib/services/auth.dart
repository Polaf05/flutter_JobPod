import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobpod/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<Credentials> get user {
    return _auth.authStateChanges().map((event) => null);
  }

  Credentials _userCredential(User user){
    return user != null ? Credentials(uid: user.uid, name: user.displayName, email: user.email ) : null;
  }
}
