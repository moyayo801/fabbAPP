import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:fabb/pages/home_app/home_pages/match_detail/match_details.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:collection';
import 'dart:math';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';

import '../../../Login/login.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({Key? key}) : super(key: key);

  @override
  _MatchesPageState createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
 

   final Stream<QuerySnapshot> match = FirebaseFirestore.instance.collection('Match').snapshots();

 DateTime _selectedDate = DateTime.now();
 String formattedDate(_selectedDate) {String format= DateFormat('dd/MM/yyyy').format(_selectedDate);
 
 return format;} 
 String Date = "00/00/0000";
  @override
  Widget build(BuildContext context) {
        var size,height,width;
         size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    
  var titeStyle =
  GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600,);
    return Scaffold(
           appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 138, 19, 15),
        title: Text("RENCONTRES", style: titeStyle,
        
        ),
                actions: [
          IconButton(
            onPressed: (){
             Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  LoginScreen()));
          },  
          icon: SvgPicture.asset(
            'asset/icons/personicon.svg',
            height: 25,
            width: 28,
            color: Colors.white,
          ) , )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(stream: match,builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return Text("wrong");
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Text("Loading");
        }
        final data = snapshot.requireData;
        final now = DateTime.now();
        return Column(
          children: [
            DatePicker(
          
                 DateTime(now.year, now.month , 01),
              height: height/7,
              width: width/5,
              initialSelectedDate: DateTime.now() ,
              selectionColor:Color.fromARGB(255, 138, 19, 15),
              locale: "fr_FR",
              onDateChange: (date) async{
 
  if (date != null && date != _selectedDate)
    setState(() {
      _selectedDate =date;
      Date =formattedDate(date);

               });
             },
            ),
            SizedBox(height: height/22,),
            Container(
              height: height/1.7,
              child: MatchDetails(Date: Date,)
            ),
          ],
        );

       },) ,
    );
      }  
  }
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  /*_showMatches(){
    if (querySnapshot != null) {
      List<Match> collection;
      var showData = querySnapshot.value;
      Map<dynamic, dynamic> values = showData;
      List<dynamic> key = values.keys.toList();
      if (values != null ) {
        for (var i = 0; i < key.length; i++) {
          data = values[key[i]];
          collection = <Match>[];
          
        }
        
      }
      
    }


  }
}
class Match {
  Match(
    {
     required this.Date,
      required this.Domicile,
     required this.Horaire,
     required this.Joue,
     required this.Visiteur
    }
  );
  String Date;
  String Domicile;
  DateTime Horaire;
  Bool Joue;
  String Visiteur;

  
}*/
