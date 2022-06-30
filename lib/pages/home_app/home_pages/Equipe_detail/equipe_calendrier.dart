import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../match_detail/match_info.dart';

class EquipeCalendier extends StatelessWidget {
  final String club;
  const EquipeCalendier({ Key? key ,required this.club}) : super(key: key);


   Stream<QuerySnapshot> matchs (BuildContext context) async* {
      yield* FirebaseFirestore.instance.collection('Match').orderBy("Horaire", descending: true).snapshots();
    }
       Stream<QuerySnapshot> domicile (BuildContext context) async* {
      yield* FirebaseFirestore.instance.collection('Match').snapshots();
    }

   Stream<QuerySnapshot> visiteur (BuildContext context) async* {
      yield* FirebaseFirestore.instance.collection('Match').where("Visiteur", isEqualTo: club).orderBy("Horaire", descending: true).snapshots();
    }
 @override
  Widget build(BuildContext context) {
    DateFormat f = new DateFormat('dd/MM/yyyy hh:mm');
    final Stream<QuerySnapshot> match = FirebaseFirestore.instance.collection('Match').orderBy("Horaire", descending: true).snapshots();
  
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
       
        body: StreamBuilder<QuerySnapshot>(stream: match,builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError){
            return Text("wrong");
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Text("Loading");
          }
          final data = snapshot.requireData;
          return ListView.builder(

            itemCount: data.size,
            itemBuilder: (context, index){
              if (data.docs[index]['Domicile'] == club) {
                            if(data.docs[index]['Joué']==false){
                 return Container(
                   height: 150,
                   child: Row(
                     children: [
                       Expanded(flex:2,
                       child: 
                        Column(
                          children: [
                            Expanded(flex: 2,
                             child:Container(
                             child:  Image.asset("asset/equipes/${data.docs[index]['Domicile']}.jpg", scale: 0.5,),
                       ),
                       ),
                            Expanded(flex: 1,
                             child:Container(
                               alignment: Alignment.center,
                             child: Text("${data.docs[index]['Domicile']}"),
                       ),
                       ),
                        Divider(thickness: 1.5,)
                          ],
                        ),
                       ),

                        Expanded(flex:2,
                       child:  Column(
                         children: [
                           Expanded(flex:2,
                           child: Container(
                             alignment: Alignment.center,
                             child: Text("VS",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                           ),
                           ),
                            Expanded(flex:2,
                           child: Container(
                             alignment: Alignment.center,
                             child: Text("${DateFormat('dd/MM/yyyy, HH:mm').format(data.docs[index]['Horaire'].toDate().add(new Duration(hours: 1)))}",style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),textAlign: TextAlign.center,),
                           ),
                           ),
                            Divider(thickness: 1.5,)
                         ],
                       ),
                       ),
                       
                 Expanded(flex:2,
                       child: 
                        Column(
                          children: [
                            Expanded(flex: 2,
                             child:Container(
                             child:  Image.asset("asset/equipes/${data.docs[index]['Visiteur']}.jpg", scale: 0.5,),
                       ),
                       ),
                            Expanded(flex: 1,
                             child:Container(
                               alignment: Alignment.center,
                             child: Text("${data.docs[index]['Visiteur']}"),
                       ),
                       ),
                        Divider(thickness: 1.5,)
                          ],
                        ),
                       ),
                        
                     ],
                   ),
                 );
              }else{
                return  RawMaterialButton(
          onPressed: () {
             Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  MatchInfo(dom: data.docs[index]['Domicile'], vis: data.docs[index]['Visiteur'], scoDom: data.docs[index]['scoreDomicile'], scoVis: data.docs[index]['scoreVisiteur'], horaire: data.docs[index]['Horaire'],)));
       
           },
          child:Container(
                   height: 150,
                   child: Row(
                     children: [
                       Expanded(flex:2,
                       child: 
                        Column(
                          children: [
                            Expanded(flex: 2,
                             child:Container(
                             child:  Image.asset("asset/equipes/${data.docs[index]['Domicile']}.jpg", scale: 0.5,),
                       ),
                       ),
                            Expanded(flex: 1,
                             child:Container(
                               alignment: Alignment.center,
                             child: Text("${data.docs[index]['Domicile']}"),
                       ),
                       ),
                        Divider(thickness: 1.5,)
                          ],
                        ),
                       ),

                        Expanded(flex:2,
                       child:  Column(
                         children: [
                           Expanded(flex:2,
                           child: Container(
                             alignment: Alignment.center,
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text("Terminé",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                                 SizedBox(height: 17,),
                                  Text("${data.docs[index]['scoreDomicile']} - ${data.docs[index]['scoreVisiteur']}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                               
                                ],
                             ),
                           ),
                           ),
                            Expanded(flex:2,
                           child: Container(
                             alignment: Alignment.center,
                             child: Text("${DateFormat('dd/MM/yyyy, HH:mm').format(data.docs[index]['Horaire'].toDate().add(new Duration(hours: 1)))}",style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),textAlign: TextAlign.center,),
                           ),
                           ),
                           
                         ],
                       ),
                       ),
                       
                 Expanded(flex:2,
                       child: 
                        Column(
                          children: [
                            Expanded(flex: 2,
                             child:Container(
                             child:  Image.asset("asset/equipes/${data.docs[index]['Visiteur']}.jpg", scale: 0.5,),
                       ),
                       ),
                            Expanded(flex: 1,
                             child:Container(
                               alignment: Alignment.center,
                             child: Text("${data.docs[index]['Visiteur']}"),
                       ),
                       ),
                        Divider(thickness: 1.5,)
                          ],
                        ),
                       ),
                        Divider(thickness: 1.5,)
                     ],
                   ),
                 ),
               );
              }
              } else {
                if (data.docs[index]['Visiteur']==club) {
                   if(data.docs[index]['Joué']==false){
                 return  Container(
                   height: 150,
                   child: Row(
                     children: [
                       Expanded(flex:2,
                       child: 
                        Column(
                          children: [
                            Expanded(flex: 2,
                             child:Container(
                             child:  Image.asset("asset/equipes/${data.docs[index]['Domicile']}.jpg", scale: 0.5,),
                       ),
                       ),
                            Expanded(flex: 1,
                             child:Container(
                               alignment: Alignment.center,
                             child: Text("${data.docs[index]['Domicile']}"),
                       ),
                       ),
                        Divider(thickness: 1.5,)
                          ],
                        ),
                       ),

                        Expanded(flex:2,
                       child:  Column(
                         children: [
                           Expanded(flex:2,
                           child: Container(
                             alignment: Alignment.center,
                             child: Text("VS",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                           ),
                           ),
                            Expanded(flex:2,
                           child: Container(
                             alignment: Alignment.center,
                             child: Text("${DateFormat('dd/MM/yyyy, HH:mm').format(data.docs[index]['Horaire'].toDate().add(new Duration(hours: 1)))}",style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),textAlign: TextAlign.center,),
                           ),
                           ),
                            Divider(thickness: 1.5,)
                         ],
                       ),
                       ),
                       
                 Expanded(flex:2,
                       child: 
                        Column(
                          children: [
                            Expanded(flex: 2,
                             child:Container(
                             child:  Image.asset("asset/equipes/${data.docs[index]['Visiteur']}.jpg", scale: 0.5,),
                       ),
                       ),
                            Expanded(flex: 1,
                             child:Container(
                               alignment: Alignment.center,
                             child: Text("${data.docs[index]['Visiteur']}"),
                       ),
                       ),
                        Divider(thickness: 1.5,)
                          ],
                        ),
                       ),
                        
                     ],
                   ),
                 );
              }else{
                return  RawMaterialButton(
          onPressed: () {
             Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  MatchInfo(dom: data.docs[index]['Domicile'], vis: data.docs[index]['Visiteur'], scoDom: data.docs[index]['scoreDomicile'], scoVis: data.docs[index]['scoreVisiteur'], horaire: data.docs[index]['Horaire'],)));
       
           },
          child:Container(
                   height: 150,
                   child: Row(
                     children: [
                       Expanded(flex:2,
                       child: 
                        Column(
                          children: [
                            Expanded(flex: 2,
                             child:Container(
                             child:  Image.asset("asset/equipes/${data.docs[index]['Domicile']}.jpg", scale: 0.5,),
                       ),
                       ),
                            Expanded(flex: 1,
                             child:Container(
                               alignment: Alignment.center,
                             child: Text("${data.docs[index]['Domicile']}"),
                       ),
                       ),
                        Divider(thickness: 1.5,)
                          ],
                        ),
                       ),

                        Expanded(flex:2,
                       child:  Column(
                         children: [
                           Expanded(flex:2,
                           child: Container(
                             alignment: Alignment.center,
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text("Terminé",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                                 SizedBox(height: 17,),
                                  Text("${data.docs[index]['scoreDomicile']} - ${data.docs[index]['scoreVisiteur']}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                               
                                ],
                             ),
                           ),
                           ),
                            Expanded(flex:2,
                           child: Container(
                             alignment: Alignment.center,
                             child: Text("${DateFormat('dd/MM/yyyy, HH:mm').format(data.docs[index]['Horaire'].toDate().add(new Duration(hours: 1)))}",style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),textAlign: TextAlign.center,),
                           ),
                           ),
                           
                         ],
                       ),
                       ),
                       
                 Expanded(flex:2,
                       child: 
                        Column(
                          children: [
                            Expanded(flex: 2,
                             child:Container(
                             child:  Image.asset("asset/equipes/${data.docs[index]['Visiteur']}.jpg", scale: 0.5,),
                       ),
                       ),
                            Expanded(flex: 1,
                             child:Container(
                               alignment: Alignment.center,
                             child: Text("${data.docs[index]['Visiteur']}"),
                       ),
                       ), 
                       Divider(thickness: 1.5,)
                          ],
                        ),
                       ),
                       
                     ],
                   ),
                 ),
               );
              }
                } else {
                  return SizedBox(height: 0,);
                }
              }





              
                
                
                
                 
                 
                   
                 
              
            },
          );
        },) ,
      ),
    );
  }
}