import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobpod/models/user.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final facebookSignIn = FacebookLogin();
  final googleSignIn = GoogleSignIn();

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
//sign in fb

  Future resultFacebookSignIn() async {
    FacebookLoginResult _result = await facebookSignIn.logIn(['email']);
    switch (_result.status) {
      case FacebookLoginStatus.cancelledByUser:
        print("cancelledByUser");
        break;
      case FacebookLoginStatus.error:
        print("Error");
        break;
      case FacebookLoginStatus.loggedIn:
        await signInWithFacebook(_result);
        break;
    }
  }

  Future signInWithFacebook(FacebookLoginResult _result) async {
    try {
      FacebookAccessToken _accessToken = _result.accessToken;
      AuthCredential credential =
          FacebookAuthProvider.credential(_accessToken.token);
      UserCredential result = await _auth.signInWithCredential(credential);
      User user = result.user;

      //add database
      //await DatabaseService(uid: user.uid)
      //  .updateUserData(user.email, user.displayName, "client");

      return _userCredential(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in Goggle

  Future signInWithGoogle() async {
    try {
      final guser = await googleSignIn.signIn();

      final googleAuth = await guser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential result = await _auth.signInWithCredential(credential);
      User user = result.user;

      //add database
      //await DatabaseService(uid: user.uid)
      //  .updateUserData(user.email, user.displayName, "client");

      return _userCredential(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out

  Future<void> signOutUser() async {
    try {
      await facebookSignIn.logOut();
      await googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
