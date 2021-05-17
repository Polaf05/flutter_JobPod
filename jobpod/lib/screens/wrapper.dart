import 'package:flutter/material.dart';
import 'package:jobpod/screens/authenticate/authentication.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //will return auth if not logged in nad returns home if logged in
    return Authentication();
  }
}
