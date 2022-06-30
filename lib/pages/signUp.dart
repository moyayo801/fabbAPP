import 'dart:async';

import 'package:fabb/auth.dart';
import 'package:fabb/pages/home_app/home_2.dart';
import 'package:fabb/pages/home_app/home_screen.dart';
import 'package:fabb/pages/reuse.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({ Key? key }) : super(key: key);

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  
  @override
  Widget build(BuildContext context) {
   final Auth auth = Auth();
    bool isCon = auth.isConnected();
    User? firebaseUser = FirebaseAuth.instance.currentUser;
    // Define a widget
Widget firstWidget;

// Assign widget based on availability of currentUser
if (firebaseUser != null) {
  firstWidget = Home2();
} else {
  firstWidget = Home();
}

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("asset/logo3.png"),
                const SizedBox(
                  height: 30,
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}