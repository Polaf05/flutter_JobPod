import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:jobpod/services/auth.dart';

class Signup extends StatefulWidget {
  final Function toggle;

  Signup({this.toggle});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String name = "";
  String email = "";
  String username = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.20,
              color: Color(0xFFD2F9DB),
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 60, 100, 0),
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage("assets/Icon_Group.png"), width: 420, height: 100,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
              child: Text(
                "Sign up:",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w700, fontSize: 25.89),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 15),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      validator: (value) =>
                          value.isEmpty ? "Name cannot be empty" : null,
                      onChanged: (val) {
                        setState(() => name = val);
                      },
                      style: TextStyle(fontFamily: 'RadikalLight'),
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(), labelText: "Name"),
                    ),
                    TextFormField(
                      validator: (value) =>
                          value.isEmpty ? "Email cannot be empty" : null,
                      onChanged: (val) {
                        print(email);
                        setState(() => email = val);
                      },
                      style: TextStyle(fontFamily: 'RadikalLight'),
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(), labelText: "Email"),
                    ),
                    TextFormField(
                      validator: (value) =>
                          value.isEmpty ? "Username cannot be empty" : null,
                      onChanged: (val) {
                        setState(() => username = val);
                      },
                      style: TextStyle(fontFamily: 'RadikalLight'),
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Username"),
                    ),
                    TextFormField(
                      validator: (value) => value.length > 6
                          ? "Password must be 6 character long"
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                      style: TextStyle(fontFamily: 'RadikalLight'),
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Password"),
                      obscureText: true,
                    ),
                    TextFormField(
                      validator: (value) =>
                          value != password ? "Passowrd did not match" : null,
                      style: TextStyle(fontFamily: 'RadikalLight'),
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Confirm Password"),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "or sign up using",
                    style: GoogleFonts.roboto(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.facebookF,
                            color: Color(0xFF497A54),
                          ),
                          onPressed: () async {
                            await _auth.resultFacebookSignIn();
                          }),
                      IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.google,
                            color: Color(0xFF497A54),
                          ),
                          onPressed: () async {
                            await _auth.signInWithGoogle();
                          }),
                      IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.twitter,
                            color: Color(0xFF497A54),
                          ),
                          onPressed: () {}),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: TextButton(
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    dynamic result =
                        await _auth.signUpFirebase(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Email and Password did not match';
                      });
                    }
                  }
                },
                child: Text(
                  "Sign me up!",
                  style: GoogleFonts.roboto(fontSize: 25.89),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: TextButton(
                onPressed: () {
                  widget.toggle();
                },
                child: Text(
                  "Already have an account?",
                  style: GoogleFonts.roboto(
                      fontSize: 12, decoration: TextDecoration.underline),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
