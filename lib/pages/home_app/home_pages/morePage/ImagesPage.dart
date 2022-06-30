

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class imagesPage extends StatefulWidget {
  const imagesPage({ Key? key }) : super(key: key);

  @override
  State<imagesPage> createState() => _imagesPageState();
 }

class _imagesPageState extends State<imagesPage> {
   final Stream<QuerySnapshot> Images = FirebaseFirestore.instance.collection('ImageLinks').snapshots();

  @override
  Widget build(BuildContext context) {
      var titeeStyle =
  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);
    return Scaffold(
        appBar: AppBar(      
                backgroundColor: Color.fromARGB(255, 138, 19, 15),
        title: Text("Images".toUpperCase(), style:titeeStyle,
        
        ),),
      body: SafeArea(
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0) ,
          child:Column(
            children: [
              Expanded(
                child:Padding(
                  padding: EdgeInsets.symmetric(vertical: 18.0),
                  child: StreamBuilder<QuerySnapshot>(stream: Images,builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return Text("wrong");
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Text("Loading");
        }
        final data = snapshot.requireData;
                   return StaggeredGridView.countBuilder(
                      crossAxisCount: 2, 
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      itemCount: data.size,
                      itemBuilder: (context,index){
                        return Container(
                          decoration: BoxDecoration(
                            color:Colors.transparent,
                            borderRadius: BorderRadius.circular(8.0),
                             ),
                             child:ClipRRect(
                               borderRadius:BorderRadius.circular(8.0),
                               child: Image.network("${data.docs[index]['URL']}",fit: BoxFit.fill,)
                               ),
                                ) ;
                      
                      },
                      staggeredTileBuilder: (index){
                        return new StaggeredTile.count(1, index.isEven ? 1.2 : 2);
                      }
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