import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fabb/pages/home_app/home_pages/morePage/actualitesDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class EquipeActus extends StatefulWidget {
   final String club;
  const EquipeActus({ Key? key, required this.club }) : super(key: key);

  @override
  State<EquipeActus> createState() => _EquipeActusState();
}

class _EquipeActusState extends State<EquipeActus> {
   
  @override
  Widget build(BuildContext context) {
     final Stream<QuerySnapshot> acualites = FirebaseFirestore.instance.collection('Actualités').where("à propos", isEqualTo: "${widget.club}").snapshots();
 
     var numStyle =
  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black);

     var titStyle =
  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);

     initializeDateFormatting('fr_FR');
     DateFormat f = new DateFormat.yMMMMEEEEd('fr_FR');
     DateFormat ff = new DateFormat.Hm('fr_FR');
     DateFormat fff = new DateFormat.yMMMMEEEEd('fr_FR').add_Hm();
    return Scaffold(
     body: SafeArea(
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0) ,
          child:Column(
            children: [
              Expanded(
                child:Padding(
                  padding: EdgeInsets.symmetric(vertical: 18.0),
                  child: StreamBuilder<QuerySnapshot>(stream: acualites,builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
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
     
            return RawMaterialButton(
              onPressed: () { 
                   Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ActDetails(description: data.docs[index]['Description'], message: data.docs[index]['Message'], horaire: fff.format(DateTime.fromMicrosecondsSinceEpoch(data.docs[index]['Horaire'].microsecondsSinceEpoch)) )));
              },
              child: Container(

                height: 190,
                width: double.infinity,
                child: Column(
                  children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
    
                    child: Text(f.format(DateTime.fromMicrosecondsSinceEpoch(data.docs[index]['Horaire'].microsecondsSinceEpoch)).toUpperCase(),
                     
                     style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  )
                
                  ),
              Expanded(
                flex: 2,
                child:Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        child: IntrinsicHeight(
                          child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 20,),
                                   Column(  
                            
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       
                                       Padding(
                                         padding: const EdgeInsets.fromLTRB(4, 0, 12, 5),
                                         child: Text(ff.format(DateTime.fromMicrosecondsSinceEpoch(data.docs[index]['Horaire'].microsecondsSinceEpoch)),
                                          style: numStyle,),
                                       ),
                                           Icon(
                                            Icons.radar,
                                            color: Colors.black45,
                                            size: 30.0,
                                            semanticLabel: 'Text to announce in accessibility modes',
                                          ),
                                      ],
                                   ),
                                        VerticalDivider(
                                      
                                         color: Color.fromARGB(255, 138, 19, 15),
                                         thickness: 4,
                                       ),
                            ],),
                        )
                      ),
                    ),
                   Expanded(
                     flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerLeft,
                            child: Text("${data.docs[index]['Description']}", style: titStyle),)),
                          Expanded(
                            flex: 4,
                            child: Row(
                                      children:  [
                                        Expanded(
                                          child: Text("${data.docs[index]['Message']}",
                                          style: TextStyle(fontSize: 15),
                                          softWrap: false,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis, )
                                        ),
                                      ],
                                    )),
                        ],)
                    ),
                  ],
                )
                
                  ),
                  Divider(thickness: 1.5,)
                ],)
              )
                   );
              
              
              
               
               
                 
               
            
          },
        );
                  },),
                ),
                 ),
            ]) ,
          ) 
          ),
          );
  }
}