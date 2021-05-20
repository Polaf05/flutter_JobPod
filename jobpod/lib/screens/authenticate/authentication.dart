import 'package:flutter/material.dart';
import 'package:jobpod/screens/authenticate/signin.dart';
import 'package:jobpod/screens/authenticate/signup.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool showSignin = true;
  void toggleSignin() {
    setState(() => showSignin = !showSignin);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignin) {
      return Signin(toggle: toggleSignin);
    } else {
      return Signup(toggle: toggleSignin);
    }
  }
}
