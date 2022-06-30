import 'package:cloud_firestore/cloud_firestore.dart';
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

class propoPage extends StatefulWidget {
  const propoPage({ Key? key }) : super(key: key);

  @override
  State<propoPage> createState() => _propoPageState();
}

class _propoPageState extends State<propoPage> {



  @override
  Widget build(BuildContext context) {
     var size,height,width;
         size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
      var titeStylee =
  GoogleFonts.inter(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400,);
   
      var titeStyleee =
  GoogleFonts.inter(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold,);
   
 var titeStyleeee =
  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500,);
   


     var titeStyle =
  GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600,);
    return Scaffold(
      appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 138, 19, 15),
        title: Text("à propos de la FABB", style: titeStyle,
        
        
        ),
               
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Container(child: 
         SingleChildScrollView(
           physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
           child: Expanded(
             child: Column(
               children: [
                  Container(
                    height: width/3,
                    width: width/2,
                    child: Image.asset("asset/equipes/loogo.jpg",),
                   ),
                    Container(
                    alignment: Alignment.center,
                    height: height/12,
                    width: double.infinity,
                    color: Color.fromARGB(255, 212, 212, 212),
                    child: Text("Présentation de la Fédération Algérienne de Basket-ball", style: titeStyleee,),
                   ),
                 Text("La Fédération algérienne de basket-ball (FABB) est une association regroupant les clubs de basket-ball d'Algérie et organisant les compétitions nationales et les matchs internationaux de la sélection d'Algérie. crée le 17 novembre 1962.\n La Fédération algérienne est affiliée à la FIBA depuis 1963." ,
                 style: titeStylee
                   ),
                   SizedBox(height: height/20,),
                   Container(
                    alignment: Alignment.center,
                    height: height/12,
                    width: double.infinity,
                    color: Color.fromARGB(255, 212, 212, 212),
                    child: Text("Le Président de la F.A.B.B", style: titeStyleee,),
                   ),
                   Container(
                    width: width*0.80,
                    child: Image.asset("asset/bouarifi.jpg"),
                   ),
                   Container(
                    alignment: Alignment.center,
                    height: height/30,
                    width: double.infinity,
                    child: Text("Mr Bouarifi Rabah a été élu en 2019 à la tete de la FABB.",
                    style: titeStyleeee,
                    ),
                   ),
                   SizedBox(height: height/20,),
                                  Container(
                    alignment: Alignment.center,
                    height: height/12,
                    width: double.infinity,
                    color: Color.fromARGB(255, 212, 212, 212),
                    child: Text("Contacts et adresse de la F.A.B.B", style: titeStyleee,),
                   ),
                    Container(
                      width: width,
                      height: height/17,
                      alignment: Alignment.centerLeft,
                      child: Text("E-mail : algeriafederation@gmail.com" ,
                 style: titeStyleee
                   ),
                    ),
                    SizedBox(height: height/40,),
                       Container(
                         width: width,
                      height: height/17,
                         child: Text("Numéro de téléphone : +213 23 29 51 72 / +213 23 29 51 60" ,
                 style: titeStyleee
                   ),
                       ),
                       SizedBox(height: height/40,),
                       Container(
                         width: width,
                      height: height/17,
                         child: Text("Adresse : Zouaoua - Rue Abdelkrim Hamza - Lot 2 - Dely Ibrahim - Alger." ,
                 style: titeStyleee
                   ),
                       ),
               ],
             ),
           ),
         ),
        ),
      ),
    );
  }
}