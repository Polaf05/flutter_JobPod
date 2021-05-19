import "package:flutter/material.dart";

class Signin extends StatefulWidget {
  final Function toggle;

  Signin({this.toggle});

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          width: double.infinity,
          color: Colors.green,
          child: Text("JOBPOD"),
        )
      ],
    ));
  }
}
