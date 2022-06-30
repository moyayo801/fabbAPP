import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fabb/pages/home_app/home_pages/match_detail/match_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class MatchDetails extends StatelessWidget {
  final String Date;

   MatchDetails({ Key? key,required this.Date  }) : super(key: key);

     Stream<QuerySnapshot> Match (BuildContext context) async* {
      yield* FirebaseFirestore.instance.collection('Match').where("Date", isEqualTo: Date).snapshots();
    }
DateFormat f = new DateFormat('dd/MM/yyyy hh:mm');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: StreamBuilder<QuerySnapshot>(stream: Match(context),builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return Text("wrong");
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Text("Loading");
        }
        final data = snapshot.requireData;
        var now = new DateTime.now();
        return ListView.builder(

          itemCount: data.size,
          itemBuilder: (context, index){
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
                        ],
                      ),
                     ),
                   ],
                 ),
               ),
             );
            }
            
           
            
              
              
              
               
               
                 
               
            
          },
        );
      },) ,
    );
    
  }
}