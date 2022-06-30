import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants.dart';
import '../joueur_detail/jouCrd.dart';

class EnEff extends StatefulWidget {
  const EnEff({ Key? key }) : super(key: key);

  @override
  State<EnEff> createState() => _EnEffState();
}

class _EnEffState extends State<EnEff> {
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

    var dataDom=  await FirebaseFirestore.instance.collection('Joueur').where("isSelected", isEqualTo: true).get();
    var dataVis =  await FirebaseFirestore.instance.collection('EquipeNationale').get();
   
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
                                            _nat.isNotEmpty ? Text("${_nat[0]['Entraineur']}",style:topTextStyle) : Text(""),
                                             SizedBox(height: height/60,),
                                             Text("Coach en chef",style: bottomTextStyle,)
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
                                            _nat.isNotEmpty ? Text("${_nat[0]['Adjoint']}",style:topTextStyle) : Text(""),
                                             SizedBox(height: height/60,),
                                             Text("Adjoit-coach",style: bottomTextStyle,)
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
                   child: Text("Joueurs sélectionnées" ,style: titeeStyle,),
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