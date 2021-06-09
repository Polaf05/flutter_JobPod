import 'package:flutter/material.dart';
import 'package:jobpod/screens/authenticate/authentication.dart';
import 'package:provider/provider.dart';
import 'package:jobpod/models/user.dart';
import 'package:jobpod/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Credentials>(context);

    //will return auth if not logged in nad returns home if logged in

    if (user == null) {
      return Authentication();
    } else {
      return Home();
    }
  }
}
