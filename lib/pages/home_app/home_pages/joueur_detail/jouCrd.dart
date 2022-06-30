import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fabb/pages/home_app/home_pages/joueur_detail/joueur-detail.dart';
import 'package:fabb/pages/home_app/home_pages/joueur_detail/joueur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../constants.dart';


Widget buildJouCard(BuildContext context, DocumentSnapshot document) {
  final jou = Joueur.fromSnapshot(document);
    calculateAge(DateTime birthDate) {
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - birthDate.year;
  int month1 = currentDate.month;
  int month2 = birthDate.month;
  if (month2 > month1) {
    age--;
  } else if (month1 == month2) {
    int day1 = currentDate.day;
    int day2 = birthDate.day;
    if (day2 > day1) {
      age--;
    }
  }
  return age;
}
  String dda = jou.Date;
   List ddaa = dda.split("/");
   var reversed = new List.from(ddaa.reversed);
if (reversed[1].toString().length==1) {
  String r ="0"+reversed[1];
  reversed[1]=r;
}
if (reversed[2].toString().length==1) {
  String r ="0"+reversed[2];
  reversed[2]=r;
}





   String dte = reversed.join("-");
    DateTime dt1 = DateTime.parse(dte);
       DateFormat formatter = DateFormat('yyyy-MM-dd');
       String formatted = formatter.format(dt1);
       DateTime dt2 = DateTime.parse(formatted);
    int ae = calculateAge(dt2);
 



 var bottomTextStyle =
  GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400);

var topTextStyle =
  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF2C53B1));

    var titeStyle =
  GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600,);

  return RawMaterialButton(
                    onPressed: () { },
                    child:Expanded(
                           child: Container(
                             height: 85,
                             child: Card(
                               color: mBackgroundColor,
                               elevation: 0,
            
            
                               child: InkWell(
                                 onTap: () {
                               
                                 },
                                 child: Row(
                                   children: <Widget>[
                                     
                                     Expanded(
                                       flex: 3,
                                       child: Container(
                                    
                                         alignment: Alignment.center,
                                       child: Padding(
                                         padding: const EdgeInsets.fromLTRB(0, 15, 15, 15),
                                         child: SvgPicture.asset("asset/icons/shirt.svg", fit: BoxFit.scaleDown,),
                                       ))),
                                   
                               
                                     Expanded(
                                       flex: 5,
                                       child: Container(
                                        
                                         
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.stretch,
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Text("${jou.Nom} ${jou.Prenom}",style:topTextStyle),
                                             SizedBox(height: 9,),
                                             Text("${jou.Club} | ${ae} ans",style: bottomTextStyle,)
                                           ],
                                         ),
                                       )),
                             
                                     Expanded(
                                      flex: 2,
                                       child: Container(
                                        
                                         height: 60,
                                         alignment: Alignment.center,
                                                                 
                                         child: Image.asset("asset/equipes/${jou.Club}.jpg", scale: 2,
                                         alignment: Alignment.centerRight,
                                         ),
                                         ),
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                           ), ),
                         );
}