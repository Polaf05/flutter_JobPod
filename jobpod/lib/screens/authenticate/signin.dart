import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:google_fonts/google_fonts.dart";

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
        body: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.35,
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.fromLTRB(30, 0, 0, 15),
                color: Color(0xFFD2F9DB),
                child: Image(image: AssetImage("assets/Icon_Group.png"))),
            Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.fromLTRB(35, 15, 0, 0),
                child: Text(
                  "Sign in:",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500, fontSize: 25.89),
                )),
            Container(
                padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Email or username"),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Password"),
                      obscureText: true,
                    ),
                  ],
                )),
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: TextButton(
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.roboto(fontSize: 12),
                ),
                onPressed: () {},
              ),
            ),
            Container(
                alignment: Alignment.center,
                child: Text(
                  "or sign in using",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400, fontSize: 16),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.facebookF,
                      color: Color(0xFF497A54),
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.google,
                      color: Color(0xFF497A54),
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.twitter,
                      color: Color(0xFF497A54),
                    ),
                    onPressed: () {}),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: TextButton(
                style: TextButton.styleFrom(primary: Color(0xFF4DB163)),
                child: Text(
                  "Sign me in!",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500, fontSize: 25.89),
                ),
                onPressed: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              alignment: Alignment.bottomCenter,
              child: TextButton(
                child: Text(
                  "Don't have an account?",
                  style: GoogleFonts.roboto(
                      fontSize: 12, decoration: TextDecoration.underline),
                ),
                onPressed: () {
                  widget.toggle();
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
