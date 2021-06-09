import 'package:flutter/material.dart';
import 'package:jobpod/services/auth.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            AuthService().signOutUser();
          },
          child: Text(
            "Log Out",
          ),
        ),
      ),
    );
  }
}
