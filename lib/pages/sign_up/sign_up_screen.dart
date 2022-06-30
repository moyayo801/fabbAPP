import 'package:flutter/material.dart';

import '../sign_up/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 138, 19, 15) ,
        title: Text("Abonnez vous".toUpperCase(),
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 18)),
      ),
      body: Body(),
    );
  }
}
