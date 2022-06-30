import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class JoueurDetails extends StatelessWidget {
  final String nom;
  final String prenom;
  final String club;
  final int Numero;
  final String post;
  var bottomTextStyle =
  GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400);

var topTextStyle =
  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF2C53B1));


  JoueurDetails(this.nom,this.prenom , this.club, this.Numero, this.post);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.square(200),
        child: AppBar(
          flexibleSpace: Expanded(
            child:Container(
              child: Row(
                children: [
                         Expanded(
                    flex: 1,
                    child: Container()),
                  Expanded(
                    flex: 3,
                    child: Container(
                    child: Column(children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                        child: SvgPicture.asset("asset/icons/shirt.svg", width: 30, height: 70, alignment: Alignment.center,) ,
                        )),
                       Expanded(
                         flex: 1,
                         child: Container(
                         child: Text("${nom} ${prenom}"),)),
                        Expanded(
                          flex: 1,
                          child: Container(
                          child:Text("${club} | ${Numero} | ${post}",style: bottomTextStyle,) ,)),
                    ]),
                    )),
                  Expanded(
                    flex: 1,
                    child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right:8.0),
                      child: Image.asset("asset/equipes/${club}.jpg", width: 60, height: 200,alignment: Alignment.bottomRight,),
                    ),
                    )),
              
                ]),
              ) ,
              
              ),
           /* Row(
            children: [
              SizedBox(width: 150,),
              Column(
                children: [
                  SizedBox(height: 80,),
                  SvgPicture.asset("asset/icons/shirt.svg", width: 30, height: 70, alignment: Alignment.center,),
                  SizedBox(height: 20,),
                  Text("${nom} ${prenom}"),
                  SizedBox(height: 10,),
                  Text("${club} | ${Numero} | ${post}",style: bottomTextStyle,)
                ],
              ),
              SizedBox(width: 75,),
            Image.asset("asset/equipes/${club}.jpg", width: 60, height: 200,alignment: Alignment.bottomRight,),
            ],

          ), */
      backgroundColor: Color(0xFF2C53B1),
        ),
      ),
    );
    }
}