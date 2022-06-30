import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fabb/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Equipe_detail/equipes_details.dart';

class Favorite extends StatefulWidget {
  const Favorite({ Key? key }) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
 
     Stream<QuerySnapshot> equipefav (BuildContext context) async* {
      yield* FirebaseFirestore.instance.collection('Equipe').where("Club", whereIn:myListFav).snapshots();
    }
  @override
  Widget build(BuildContext context) {
     var titeeStyle =
  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);
  
    return Scaffold(
            appBar: AppBar(      
                backgroundColor: Color.fromARGB(255, 138, 19, 15),
        title: Text("Favoris".toUpperCase(), style:titeeStyle,
        
        ),),
      body: StreamBuilder<QuerySnapshot>(stream: equipefav(context) ,builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
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
                               decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 252, 250, 249)),borderRadius: BorderRadius.all(Radius.circular(20),
                               ),
                               image:  DecorationImage(image: AssetImage("asset/equipes/${data.docs[index]['Club']}.jpg"),fit: BoxFit.none,scale: 3.9))
                               ),
                              
                           ),
                           Text(data.docs[index]['Club']),
                           
                         ], 
                       ),
                     ), ),
                   );
              
              
              
               
               
                 
               
            
          },
        );
            },
            ),
    );
  }
}