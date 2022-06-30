import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:galleryimage/galleryimage.dart';
import 'package:google_fonts/google_fonts.dart';

class ActDetails extends StatefulWidget {
    final String description;
  final String message;
  final String horaire;

  const ActDetails({ Key? key,required this.description,required this.message ,required this.horaire }) : super(key: key);

  @override
  State<ActDetails> createState() => _ActDetailsState();
}

class _ActDetailsState extends State<ActDetails> {
 
  @override
  Widget build(BuildContext context) {
             var numStyle =
  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black);

     var titStyle =
  GoogleFonts.inter(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black);
       var titeeStyle =
  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);
     var titeStyle =
  GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black26);
    final Stream<QuerySnapshot> Images = FirebaseFirestore.instance.collection('ImageLinks').snapshots();
    var size,height,width;
         size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(      
                backgroundColor: Color.fromARGB(255, 138, 19, 15),
        title: Text(widget.description, style:titeeStyle,
        
        ),),
      body: SafeArea(
        child:Padding(
              padding:EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0)  ,
              child: Column(
                children: [
                             Expanded(
                               flex: 1,
                               child: Container(
                                 alignment: Alignment.centerLeft,
            
                                 child: Text(widget.description, style: titStyle,),
                                 )),
                             Expanded(
                               flex: 1,
                               child: Container(
                                 alignment: Alignment.centerRight,
                        
                                 child: Text(widget.horaire.toUpperCase(), style: titeStyle,),
                                 )),
                             SingleChildScrollView(
                               scrollDirection: Axis.vertical,
                               child: Expanded(
                                 flex: 6,
                                 child: Container(
                                   height: height/2,
                                   alignment: Alignment.center,
                                 
                                   child: SingleChildScrollView(
                                     scrollDirection: Axis.vertical,
                                     child: Text("${widget.message}", style: numStyle,)),
                                   )),
                             ),
                             Expanded(
                               flex: 4,
                               child: StreamBuilder<QuerySnapshot>(stream: Images,builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return Text("wrong");
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Text("Loading");
        }
          
            final data = snapshot.requireData;   
       List<String> listOfUrls  = [];
      
           for (var i = 0; i < data.size; i++) {
          listOfUrls.add(data.docs[i]['URL']);}
                    
               
                   return   Center(
        child:            GalleryImage(
              imageUrls: listOfUrls
            ),
      );
                    
       
      
              
                  },),
                                 ),
              ]),
              ),
               ),
    );
  }
}