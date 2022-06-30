import 'package:fabb/auth.dart';
import 'package:fabb/constants.dart';
import 'package:fabb/main.dart';
import 'package:fabb/pages/home_app/home_pages/morePage/Atualites.dart';
import 'package:fabb/pages/home_app/home_pages/morePage/ImagesPage.dart';
import 'package:fabb/pages/home_app/home_pages/morePage/apropos.dart';
import 'package:fabb/pages/home_app/home_pages/morePage/equipe_nat.dart';
import 'package:fabb/pages/home_app/home_pages/morePage/favorite.dart';
import 'package:fabb/pages/home_app/home_pages/morePage/parametre_page.dart';
import 'package:fabb/pages/home_app/home_pages/morePage/videos.dart';
import 'package:fabb/pages/home_app/home_pages/morePage/videos2.dart';
import 'package:fabb/pages/home_app/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../default_button.dart';
import '../Equipe_detail/equipes_page.dart';

class MorePage2 extends StatefulWidget {
  const MorePage2({Key? key}) : super(key: key);

  @override
  _MorePage2State createState() => _MorePage2State();
}

class _MorePage2State extends State<MorePage2> {
  final Auth auth = Auth();
  @override
  Widget build(BuildContext context) {
     var Sstyle =
  GoogleFonts.inter(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600);
     var titeStyle =
  GoogleFonts.inter(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600,);
    return Scaffold(
    appBar: AppBar(
              backgroundColor: Colors.white,
        title: Text("MORE", style: titeStyle,
        
        ),
                
      
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
       
            InkWell(
              onTap: () {
                 Navigator.push(context,
                    MaterialPageRoute(builder: (context) => imagesPage()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                alignment: Alignment.centerLeft,
                height: 50,
                width: double.infinity,
                
                child: Row(
                  children: [
                     Expanded(
                       flex: 1,
                      child: Container(
                       
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.image, color: Colors.blue,))
                      ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Images", style: Sstyle,),
                        ))
                      ),
                                          Expanded(
                       flex: 1,
                      child: Container(
                       
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.arrow_forward_ios, color: Colors.grey,))
                      ),
                  ],
                ),
              ),
            ),
            Divider(indent: 20,thickness: 0.8, endIndent: 20,),
                        InkWell(
                          onTap: () {
                              Navigator.push(context,
                    MaterialPageRoute(builder: (context) => video2()));
                          },
                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            alignment: Alignment.centerLeft,
                                      
                                        height: 50,
                                      width: double.infinity,
                                      child: Row(
                  children: [
                     Expanded(
                       flex: 1,
                      child: Container(
                       
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.video_camera_back, color: Colors.blue,))
                      ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Vidéos", style: Sstyle),
                        ))
                      )
                      ,
                        Expanded(
                       flex: 1,
                      child: Container(
                       
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.arrow_forward_ios, color: Colors.grey,))
                      ),
                  ],
                ),
                                    ),
                        ),
            Divider(indent: 20,thickness: 0.8, endIndent: 20),
                 InkWell(
                   onTap: () {
                      Navigator.push(context,
                    MaterialPageRoute(builder: (context) => actualitePage()));
                   },
                   child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                     alignment: Alignment.centerLeft,
                             
                                 height: 50,
                               width: double.infinity,
                               child: Row(
                  children: [
                     Expanded(
                       flex: 1,
                      child: Container(
                       
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.newspaper, color: Colors.blue,))
                      ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Actualités", style: Sstyle),
                        ))
                      )
                      ,
                        Expanded(
                       flex: 1,
                      child: Container(
                       
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.arrow_forward_ios, color: Colors.grey,))
                      ),
                  ],
                ),
                             ),
                 ),
                  Divider(indent: 20,thickness: 0.8, endIndent: 20),
                 InkWell(
                   onTap: () {
                      Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EquipeNat()));
                   },
                   child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                     alignment: Alignment.centerLeft,
                             
                                 height: 50,
                               width: double.infinity,
                               child: Row(
                  children: [
                     Expanded(
                       flex: 1,
                      child: Container(
                       
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.shield_sharp, color: Colors.blue,))
                      ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Sélection nationale", style: Sstyle),
                        ))
                      )
                      ,
                        Expanded(
                       flex: 1,
                      child: Container(
                       
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.arrow_forward_ios, color: Colors.grey,))
                      ),
                  ],
                ),
                             ),
                 ),
                       Divider(indent: 20,thickness: 0.8, endIndent: 20),
                               InkWell(
                   onTap: () {
                      Navigator.push(context,
                    MaterialPageRoute(builder: (context) => propoPage()));
                   },
                   child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                     alignment: Alignment.centerLeft,
                             
                                 height: 50,
                               width: double.infinity,
                               child: Row(
                  children: [
                     Expanded(
                       flex: 1,
                      child: Container(
                       
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.info, color: Colors.lightGreenAccent[400],))
                      ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("à Propos", style: Sstyle),
                        ))
                      )
                      ,
                        Expanded(
                       flex: 1,
                      child: Container(
                       
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.arrow_forward_ios, color: Colors.grey,))
                      ),
                  ],
                ),
                             ),
                 ),
               
                        
        ]
        ),
    );
  }
}
