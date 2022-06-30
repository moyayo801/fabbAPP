import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Login/login.dart';

class ClassementPage extends StatefulWidget {
  const ClassementPage({Key? key}) : super(key: key);

  @override
  _ClassementPageState createState() => _ClassementPageState();
}

class _ClassementPageState extends State<ClassementPage> {
  
   final Stream<QuerySnapshot> equipes = FirebaseFirestore.instance.collection('Equipe').orderBy('Victoires', descending: true).snapshots();
   
var topTextStyle =
  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 255, 255, 255));
  var titleTextStyle =
  GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 255, 255, 255));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(95.0),
              child: AppBar(
                    title: Text("Classement", style: titleTextStyle,),
                  actions: [
                      IconButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  LoginScreen()));
                      },  icon: SvgPicture.asset(
              'asset/icons/starfiled.svg',
              height: 30,
              width: 30,
                      ), )
                    ],
                    flexibleSpace: Row(
                      children: [
                        SizedBox(width: 17,),
                        Container(
                          alignment: Alignment(0,0.8),
                          child: Row(
                            children: [
                              Text("Equipes                                            V          D          %",style: topTextStyle,)
                            ],
                          ),
                        ),
                      ],
                    ),
                    backgroundColor: Color.fromARGB(255, 0, 60, 190),
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
  
        return ListView.builder(

          itemCount: data.size,
          itemBuilder: (context, index){
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: RawMaterialButton(
                onPressed: () { },
                child:Expanded(
                       child: SizedBox(
                         height: 85,
                         child: Card(
                           color: Color(0xFFFAFAFA),
            
                           elevation: 0,
            
            
                           child: InkWell(
                             child: Row(
                             
                               children: <Widget>[
                             
                                 Container(
                                   width: 50,
                                   child: Text("${index+1}")),
            
                               Container(
                                 width: 60,
                                 child: Image.asset("asset/equipes/${data.docs[index]['Club']}.jpg", scale: 3.2,
                                           alignment: Alignment.centerRight,
                                           ),
                               ),
                               SizedBox(width: 20,),
                               Container(
                                   width: 60,
                                   child: Text("${data.docs[index]['Club']}")),
                               SizedBox(width: 50,),
                                
                                                              Container(
                                   width: 50,
                                   child: Text("${data.docs[index]['Victoires']}",style: TextStyle(color: Color.fromARGB(255, 115, 211, 6)),)),
                                                                  Container(
                                   width: 50,
                                   child: Text("${data.docs[index]['Défaites']}",style: TextStyle(color: Color.fromARGB(255, 218, 47, 35)),)),
                                                                  Container(
                                   width: 3,
                                   child: Text("${index+1}")),
                          Container(
                                   width: 50,
                                   child: Text("${data.docs[index]['Défaites']}",style: TextStyle(color: Color.fromARGB(255, 218, 47, 35)),)),
                                                                  Container(
                                   width: 50,
                                   child: Text("${data.docs[index]['Défaites']}",style: TextStyle(color: Color.fromARGB(255, 218, 47, 35)),)),
                                                                  Container(
                                   width: 50,
                                   child: Text("${data.docs[index]['Défaites']}",style: TextStyle(color: Color.fromARGB(255, 218, 47, 35)),)),
                                                                 
                               
                                SizedBox(width: 300,),
                                
                               ],
                             ),
                           ),
                         ),
                       ), ),
                     ),
            );
              
              
              
               
               
                 
               
            
          },
        );
      },
      ) ,
       
    );
  }
}
