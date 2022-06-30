import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
final FirebaseAuth auth = FirebaseAuth.instance;
  Future<User?> login({required String email, required String password, required BuildContext context}) async{
  
  User? user;
  try {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
    user = userCredential.user;
  } on FirebaseAuthException catch (e) {
    if (e.code == "user-not-found") {
      print("No user FOund");
    }
  } 
  return user;
}

 Future signOut() async{
   try {
     
     return await auth.signOut();
   } catch (e) {
     print(e.toString());
     return null;
   }
 }

 dynamic isConnected(){
   var iscon = false;
   FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      iscon = false;
    } else {
      iscon = true;
    }
  });
  return iscon;
 }

 emaill(){
   String email;
   email = auth.currentUser!.email as String;
   return email;
 }
 
}