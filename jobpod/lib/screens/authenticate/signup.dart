import "package:flutter/material.dart";

class Signup extends StatefulWidget {
  final Function toggle;

  Signup({this.toggle});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Signup")),
    );
  }
}
