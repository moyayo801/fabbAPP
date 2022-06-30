import 'package:fabb/pages/home_app/home_2.dart';
import 'package:fabb/pages/reuse.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Login/login.dart';

class Splash2 extends StatefulWidget {
  const Splash2({Key? key}) : super(key: key);

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  void initState() {
    super.initState();
  _navigatehome();
  }

  _navigatehome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home2()));
  }

  @override
  Widget build(BuildContext context) {
     var titeStyle =
  GoogleFonts.inter(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w600,);
   var titeStylee =
  GoogleFonts.inter(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600,);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 174, 26, 21),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(49, 50, 12, 0),
            child: Expanded(
              flex: 1,
              child: Container(
              alignment: Alignment.center,
              width: double.infinity,
          
              child: Text("الفدرالية الجزائرية لكرة السلة",style: titeStyle,),)),
          ),
          Expanded(
            flex: 8,
            child: Container(child: logoWidget("asset/equipes/loogo.jpg"),)),
           Expanded(
             flex: 1,
             child: Container(child: Text("fédération algerienne de basket-ball".toUpperCase(),style: titeStylee),)),
        ],),
      )
    );
  }
}
