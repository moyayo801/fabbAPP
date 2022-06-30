import 'package:flutter/material.dart';
import 'body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 138, 19, 15),
        title: Text('Connectez Vous'.toUpperCase(),
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 18)),
      ),
      body: Body(),
    );
  }
}
