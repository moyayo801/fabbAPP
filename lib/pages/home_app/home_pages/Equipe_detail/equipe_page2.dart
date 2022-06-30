
import 'package:fabb/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Login/login.dart';
import 'equipes_details.dart';



class EquipePage2 extends StatefulWidget {
  const EquipePage2({Key? key}) : super(key: key);

  @override
  _EquipePage2State createState() => _EquipePage2State();
}

class _EquipePage2State extends State<EquipePage2> {
  var topTextStyle =
  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 8, 8, 8));

  var titeStyle =
  GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600,);

  final Stream<QuerySnapshot> equipes = FirebaseFirestore.instance.collection('Equipe').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 138, 19, 15),
        title: Text("ÉQUIPES", style: titeStyle,
        
        ),
        
      ),
      body: StreamBuilder<QuerySnapshot>(stream: equipes,builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return Text("wrong");
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Text("Loading");
        }
        final data = snapshot.requireData;
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 16, mainAxisExtent: 120),
          itemCount: data.size,
          itemBuilder: (context, index){
            return RawMaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  EquipeDetails(data.docs[index]['Club'], data.docs[index]['Nom'], data.docs[index]['Défaites'], data.docs[index]['Victoires'],data.docs[index]['URL'])));
                     
              },
              child:Expanded(
                     child: Card(
                       color: mBackgroundColor,

                       elevation: 0,
                       child: Column(
                         children: <Widget>[
                           Expanded(
                             child: Container(
                               margin: EdgeInsets.all(4),
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,  
                          
                                border: Border.all(width: 1.2, color: Color.fromARGB(255, 9, 9, 9)),
                               image:  DecorationImage(image: NetworkImage(data.docs[index]['URL']),fit: BoxFit.none,scale: 4.3)
                               )
                               ),
                              
                           ),
                           Text(data.docs[index]['Club'], style: topTextStyle,),
                           
                         ], 
                       ),
                     ), ),
                   );
              
              
              
               
               
                 
               
            
          },
        );
      },) ,
    );
  }
}


