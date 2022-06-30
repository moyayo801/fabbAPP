// @dart=2.9

import 'package:fabb/auth.dart';
import 'package:fabb/pages/home_app/home_2.dart';
import 'package:fabb/pages/signUp.dart';
import 'package:fabb/pages/splash/splash_screen.dart';
import 'package:fabb/pages/splash/splash_screen2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fabb/pages/home_app/home_screen.dart';



Future<void>  main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      final Auth auth = Auth();
    bool isCon = auth.isConnected();
    User firebaseUser = FirebaseAuth.instance.currentUser;
    // Define a widget
Widget firstWidget;

// Assign widget based on availability of currentUser
if (firebaseUser != null) {
  firstWidget = Splash2();
} else {
  firstWidget = Splash1();
}
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello World Flutter Application',
      
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            centerTitle: true,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            color: Colors.white,
            titleTextStyle: Theme.of(context).textTheme.headline6),
           
                          primaryColor: Color.fromARGB(255, 228, 217, 222), // outdated and has no effect to Tabbar
        accentColor: Color.fromARGB(255, 186, 193, 194)
      ),
      
      home: firstWidget,
    );
    
  }
  
}
