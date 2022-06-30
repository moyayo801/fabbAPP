import 'package:fabb/uppass/up_body.dart';
import 'package:flutter/material.dart';


class UpScreen extends StatelessWidget {
  static String routeName = "/up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mot de passe et sécurité",
            style: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18)),
      ),
      body: Body(),
    );
  }
}
