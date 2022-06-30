import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fabb/default_buttonB.dart';
import 'package:fabb/default_buttonR.dart';
import 'package:fabb/pages/signUp.dart';
import 'package:fabb/pages/sign_up/sign_up_screen.dart';
import 'package:fabb/uppass/up_screen.dart';
import 'package:fabb/uppass/updatePASS.dart';
import 'package:fabb/pages/home_app/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../auth.dart';
import '../../../../default_button.dart';

class ParaPage extends StatefulWidget {
  const ParaPage({ Key? key }) : super(key: key);

  @override
  State<ParaPage> createState() => _ParaPageState();
}

class _ParaPageState extends State<ParaPage> {

  final Auth auth = Auth();
  

  List _user = [];
    List _nat = [];
    late Future resultsLoaded;

      @override
  void initState() {
    super.initState();
     
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
   resultsLoaded = getDomVisURL();
  }

    getDomVisURL() async {

    var dataDom=  await FirebaseFirestore.instance.collection('Utilisateurs').where('UID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get();

   
   setState(() {
     _user =dataDom.docs;
   });
   
    return "complete";
  }

  @override
  Widget build(BuildContext context) {
     var titeStyle =
  GoogleFonts.inter(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600,);
    return Scaffold(
      appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 138, 19, 15),
        title: Text("Paramétres".toUpperCase(), style: titeStyle,
        
        ),
               
      ),
      body: Container(child: 
       Column(
         children: [
            SizedBox(height: 20,),
           Center(
                                 child: Text("Vos informations personnelles", textAlign: TextAlign.center, style: TextStyle(
                                   color: Colors.black54,
                                   fontSize: 24,
                                   fontWeight: FontWeight.w300
                                 ),),
                               ),
                               SizedBox(height: 30,), 
                                _user.isEmpty?   Text("Nom :", style: TextStyle(
                                 fontSize: 16,
                                 fontWeight: FontWeight.bold
                               ),):

                                 Text("Nom : ${_user[0]['Nom']}".toUpperCase(), style: TextStyle(
                                 fontSize: 16,
                                 fontWeight: FontWeight.bold
                               ),),
                                SizedBox(height: 30,),
                               _user.isEmpty?   Text("Prénom :", style: TextStyle(
                                 fontSize: 16,
                                 fontWeight: FontWeight.bold
                               ),):

                                 Text("Prénom : ${_user[0]['Prénom']}".toUpperCase(), style: TextStyle(
                                 fontSize: 16,
                                 fontWeight: FontWeight.bold
                               ),),
                                SizedBox(height: 30,),
                                _user.isEmpty?   Text("E-mail :", style: TextStyle(
                                 fontSize: 16,
                                 fontWeight: FontWeight.bold
                               ),):

                                 Text("E-mail : ${_user[0]['Adresse mail']}", style: TextStyle(
                                 fontSize: 16,
                                 fontWeight: FontWeight.bold
                               ),),
                                SizedBox(height: 30,),
                        _user.isEmpty?   Text("Équipe Favorite :", style: TextStyle(
                                 fontSize: 16,
                                 fontWeight: FontWeight.bold
                               ),):

                                 Text("Équipe Favorite : ${_user[0]['Favoris']}", style: TextStyle(
                                 fontSize: 16,
                                 fontWeight: FontWeight.bold
                               ),),
                                SizedBox(height: 50,),
                                














                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DefaultButtonB(
              text: "Modifier Mot de passe",
              press: ()  {

             Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  UpScreen()));


              },
            ),
                      ),
            SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: DefaultButtonR(
                text: "Déconnexion",
                press: ()  {

                 
                    auth.signOut();
                   Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => Home()),
  (Route<dynamic> route) => false,
);


                },
              ),
           ),
         ],
       ),
      ),
    );
  }
}