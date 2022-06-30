import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../constants.dart';
import '../joueur_detail/jouCrd.dart';

class EquipeEffectif extends StatefulWidget {
  final String club;
  const EquipeEffectif({ Key? key, required this.club }) : super(key: key);

  @override
  State<EquipeEffectif> createState() => _EquipeEffectifState();
}

class _EquipeEffectifState extends State<EquipeEffectif> {
    List _joueur = [];
    List _nat = [];
    late Future resultsLoaded;

      @override
  void initState() {
    super.initState();
     
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
   resultsLoaded = getDomVisURL();
  }

    getDomVisURL() async {

    var dataDom=  await FirebaseFirestore.instance.collection('Joueur').where("Club", isEqualTo: "${widget.club}").get();
    var dataVis =  await FirebaseFirestore.instance.collection('Entraineur').where("Club", isEqualTo: "${widget.club}").get();
   
   setState(() {
     _joueur =dataDom.docs;
     _nat = dataVis.docs;
   });
   
    return "complete";
  }

 var bottomTextStyle =
  GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400);

var topTextStyle =
  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF2C53B1));

      var titeStyle =
  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);

      var titeeStyle =
  GoogleFonts.inter(color: Colors.black45, fontSize: 15, fontWeight: FontWeight.w600,);

  @override
  Widget build(BuildContext context) {
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
 int agehc=0;
int ageac=0;
if (_nat.isNotEmpty) {
  
     String dda = _nat[0]["DN"];
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
    if (_nat[0]["Fonction"]=="HC") {
      setState(() {
      agehc=ae;
    });
    } else {
 setState(() {
   ageac=ae;
 });
    }
         String dda1 = _nat[1]["DN"];
   List ddaa1 = dda1.split("/");
   var reversed1 = new List.from(ddaa1.reversed);
if (reversed1[1].toString().length==1) {
  String r ="0"+reversed1[1];
  reversed1[1]=r;
}
if (reversed1[2].toString().length==1) {
  String r ="0"+reversed1[2];
  reversed1[2]=r;
}





   String dte1 = reversed1.join("-");
    DateTime dt11 = DateTime.parse(dte1);
       DateFormat formatter1 = DateFormat('yyyy-MM-dd');
       String formatted1 = formatter1.format(dt11);
       DateTime dt21 = DateTime.parse(formatted1);
    int ae1 = calculateAge(dt21);
    if (_nat[1]["Fonction"]=="HC") {
      setState(() {
      agehc=ae1;
    });
    } else {
 setState(() {
   ageac=ae1;
 });
    }
  
  
} 







              var size,height,width;
         size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child:RawMaterialButton(
                    onPressed: () { },
                    child:Expanded(
                           child: Container(
                             height: height/8,
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
                                         padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                                         child: SvgPicture.asset("asset/icons/emplo.svg", fit: BoxFit.fitHeight,),
                                       ))),
                                   
                               
                                     Expanded(
                                       flex: 8,
                                       child: Container(
                                        
                                         
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.stretch,
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                            _nat.isNotEmpty ? _nat[0]["Fonction"]=="HC"?Text("${_nat[0]['Nom']} ${_nat[0]['Prenom']}",style:topTextStyle): Text("${_nat[1]['Nom']} ${_nat[1]['Prenom']}",style:topTextStyle): Text(""),
                                             SizedBox(height: height/60,),
                                             Text("Coach en chef | ${agehc}",style: bottomTextStyle,)
                                           ],
                                         ),
                                       )),
                             
                      
                                   ],
                                 ),
                               ),
                             ),
                           ), ),
                         ),
             ),
                        Expanded(
              flex: 2,
              child:RawMaterialButton(
                    onPressed: () { },
                    child:Expanded(
                           child: Container(
                            height: height/8,
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
                                         padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                                         child: SvgPicture.asset("asset/icons/emplo.svg", fit: BoxFit.scaleDown,),
                                       ))),
                                   
                               
                                     Expanded(
                                       flex: 8,
                                       child: Container(
                                        
                                         
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.stretch,
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                           _nat.isNotEmpty ? _nat[1]["Fonction"]=="AC"?Text("${_nat[1]['Nom']} ${_nat[1]['Prenom']}",style:topTextStyle): Text("${_nat[0]['Nom']} ${_nat[0]['Prenom']}",style:topTextStyle): Text(""),
                                             SizedBox(height: height/60,),
                                             Text("Adjoit-coach | ${ageac}",style: bottomTextStyle,)
                                           ],
                                         ),
                                       )),
                             
                      
                                   ],
                                 ),
                               ),
                             ),
                           ), ),
                         ),
             ),
             Expanded(
               flex: 1,
               child:Container(
                 alignment: Alignment.centerLeft,
                 width: double.infinity,
                 child: Padding(
                   padding: const EdgeInsets.only(left: 12),
                   child: Text("Effectif actuel" ,style: titeeStyle,),
                 ),
                 color: Color.fromARGB(255, 238, 238, 238),) ),

             Expanded(
               flex: 10,
              child: ListView.builder(
                  itemCount: _joueur.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildJouCard(context, _joueur[index]),
              )
    
            ),

        ]),
    );
  }
}