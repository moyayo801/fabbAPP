import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Login/login.dart';

class ClassementPage2 extends StatefulWidget {
  const ClassementPage2({Key? key}) : super(key: key);

  @override
  _ClassementPage2State createState() => _ClassementPage2State();
}

class _ClassementPage2State extends State<ClassementPage2> {
  
   final Stream<QuerySnapshot> equipes = FirebaseFirestore.instance.collection('Equipe').orderBy('Victoires', descending: true).snapshots();
   
var topTextStyle =
  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 255, 255, 255));
  var titleTextStyle =
  GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 255, 255, 255));

  var numStyle =
  GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black);
  @override
  Widget build(BuildContext context) {
            var size,height,width;
         size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(height/9),
              child: AppBar(
                    title: Text("Classement", style: titleTextStyle,),
          
                    backgroundColor: Color.fromARGB(255, 138, 19, 15),
                  ),
                  
            ),
      body:  StreamBuilder<QuerySnapshot>(stream: equipes,builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return Text("wrong");
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Text("Loading");
        }
        final data = snapshot.requireData;
        
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Row(
                          children: [
                      
                            Container(
                              color: Color.fromARGB(255, 138, 19, 15),
                              width: width*1.9,
                              height: height/15,
                              child: Row(
                                children: [
                                   SizedBox(width: width/6.8,),
                                  Text("équipes".toUpperCase(), style: topTextStyle,), 
                                  SizedBox(width: width/2.7,),
                                  Text("PTS", style: topTextStyle,),
                                  SizedBox(width: width/8.2,),
                                  Text("J", style: topTextStyle,),
                                  SizedBox(width: width/8.2,),
                                  Text("V", style: topTextStyle,),
                                  SizedBox(width: width/8.2,),
                                  Text("D", style: topTextStyle,),
                                  SizedBox(width: width/8.2,),
                                  Text("%", style: topTextStyle,),SizedBox(width: width/8.2,),
                                  Text("PP", style: topTextStyle,),SizedBox(width: width/8.2,),
                                  Text("PC", style: topTextStyle,),SizedBox(width: width/8.2,),
                                  Text("PA", style: topTextStyle,),],
                              ),
                            ),
                          ],
                        ),
              ),
              Container(
                height: height*0.692,
                width: width*1.9,
                child: ListView.builder(
              
                  itemCount: data.size,
                  itemBuilder: (context, index){
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: RawMaterialButton(
                        onPressed: () { },
                        child:Expanded(
                               child: SizedBox(
                                 height: height/9,
                                 child: Card(
                                   color: Color(0xFFFAFAFA),
                    
                                   elevation: 0,
                    
                    
                                   child: InkWell(
                                     child: Row(
                                     
                                       children: <Widget>[
                                     
                                         Container(
                                           width: width/8,
                                           child: Text("${index+1}.", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
                    
                                       Container(
                                         width: width/7,
                                         child: Image.asset("asset/equipes/${data.docs[index]['Club']}.jpg", scale: 3.2,
                                                   alignment: Alignment.centerRight,
                                                   ),
                                       ),
                                       SizedBox(width: width/19,),
                                       Container(
                                           width: width/4.6,
                                           child: Text("${data.docs[index]['Club']}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.blue),)),
                                       SizedBox(width: width/7.5,),
                                        
                                                                      Container(
                                           width: width/5.8,
                                           child: Text("${(data.docs[index]['Victoires'])*2+data.docs[index]['Défaites']}",style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 83, 154, 2)),)),
                                                                          Container(
                                           width: width/6.8,
                                           child: Text("${data.docs[index]['Défaites']+data.docs[index]['Victoires']}",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)),
                                                                          Container(
                                
                                           width: width/6.8,
                                           child: Text("${data.docs[index]['Victoires']}",style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 41, 173, 20)),)),
                                                                          Container(
                                           width: width/6.8,
                                           child: Text("${data.docs[index]['Défaites']}",style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 218, 47, 35)),)),
                                                                          Container(
                                           width: width/6.2,
                                           child: Text("${double.parse((data.docs[index]['Victoires']/(data.docs[index]['Défaites']+data.docs[index]['Victoires'])).toStringAsFixed(2))}",style: TextStyle(fontSize: 15),)),
                                                                    Container(
                                           width: width/6.2,
                                           child: Text("0",style: TextStyle(fontSize: 15,),)),
                                                                          Container(
                                           width: width/5.5,
                                           child: Text("0",style: TextStyle(fontSize: 15,),)),
                                                                          Container(
                                           width: 10,
                                           child: Text("0",style: TextStyle(fontSize: 15,),)),
                                                                               
                                       
          
                                        
                                       ],
                                     ),
                                   ),
                                 ),
                               ), ),
                             ),
                    );
                      
                      
                      
                       
                       
                         
                       
                    
                  },
                ),
              ),
            ],
          ),
        );
      },
      ) ,
       
    );
  }
}
