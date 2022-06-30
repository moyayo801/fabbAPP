import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fabb/pages/home_app/home_pages/morePage/enACT.dart';
import 'package:fabb/pages/home_app/home_pages/morePage/enEFF.dart';
import 'package:fabb/pages/home_app/home_pages/morePage/enMEDIA.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EquipeNat extends StatefulWidget {
  const EquipeNat({ Key? key }) : super(key: key);

  @override
  State<EquipeNat> createState() => _EquipeNatState();
}

class _EquipeNatState extends State<EquipeNat> {













  @override
  Widget build(BuildContext context) {
            var size,height,width;
         size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
         var titeStyle =
  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
           preferredSize: Size.fromHeight(height/7),
          child: AppBar(
            backgroundColor:Color.fromARGB(255, 138, 19, 15) ,
                title:Text("SéLECTION NATIONALE".toUpperCase() ,style: titeStyle,) ,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(height/10),
                  child: ColoredBox(
                    color: Color.fromARGB(255, 238, 238, 238),
                    child: const TabBar(
                      labelPadding: EdgeInsets.zero,
                      labelColor: Color.fromARGB(255, 138, 19, 15),
                      indicatorColor: Color.fromARGB(255, 138, 19, 15),
                      tabs: [
                      Tab(text: 'Effectif'),
                      Tab(text: 'Actualités'),
                     Tab(text: 'Médias'),
                    ]),
                  ),
                ),
          ),
        ),
        body: TabBarView(children: [
EnEff(),
EnAct(),
EnMedia()

        
        ],),
      ),
    );
  }
}