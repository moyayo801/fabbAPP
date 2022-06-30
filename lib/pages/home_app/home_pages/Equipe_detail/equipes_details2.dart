

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fabb/constants.dart';
import 'package:fabb/pages/home_app/home_pages/Equipe_detail/EquipeMedia.dart';
import 'package:fabb/pages/home_app/home_pages/Equipe_detail/Equipe_actus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Login/login.dart';
import 'equipe-effectif.dart';
import 'equipe_calendrier.dart';
import 'equipe_infos.dart';



class EquipeDetails2 extends StatefulWidget {
  
  final String club;
  final String nom;
  final int vic;
  final int def;
    final String url;
    EquipeDetails2(this.club,this.nom,this.def,this.vic,this.url);

  @override
  State<EquipeDetails2> createState() => _EquipeDetails2State();
}

class _EquipeDetails2State extends State<EquipeDetails2> {



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

    var dataDom=  await FirebaseFirestore.instance.collection('Utilisateurs').where('UID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get();

   
   setState(() {
     _joueur =dataDom.docs;
   });
   
    return "complete";
  }





































    Stream<QuerySnapshot> equipeStream (BuildContext context) async* {
      yield* FirebaseFirestore.instance.collection('Equipe').where("Club", isEqualTo: widget.club).snapshots();
    }
    
var topTextStyle =
  GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white70);
 var topclubStyle =
  GoogleFonts.inter(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white);
 
  var numStyle =
  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white);
  
  @override
  Widget build(BuildContext context) {
    
 CollectionReference users = FirebaseFirestore.instance.collection('Utilisateurs');
 getUsers() async {

    var data=  await FirebaseFirestore.instance.collection('Utilisateurs').where('UID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).limit(1).get();
data.docs.forEach((element) {
  users
    .doc(element.id)
    .update({'Favoris': '${widget.club}'})
    .then((value) => print("User Updated"))
    .catchError((error) => print("Failed to update user: $error"));
});
  }








var tr =     _joueur.isNotEmpty ? _joueur[0]['Favoris']==widget.club : false;
    var favcol = Colors.white;
  Widget cancelButton = TextButton(
    child: Text("Non"),
    onPressed:  () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: Text("Oui"),
    onPressed:  () {
getUsers().then((value) => 
 Navigator.pop(context),
 
);
      setState(() {
       tr=true;
      });
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Favoris"),
    content: Text("Voulez-vous mettre ${widget.club} en tant qu'équipe favorite?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

    var size,height,width;
         size = MediaQuery.of(context).size;
  height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    
 bool isfav =myListFav.isNotEmpty? myListFav[0]==widget.club :false;
     var heartcol = Colors.pink; 
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height/3),
          child: AppBar(
           
            // ignore: prefer_const_constructors
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(height/20),
              child: ColoredBox(
                color: Color.fromARGB(255, 238, 238, 238),
                child: const TabBar(
                  labelPadding: EdgeInsets.zero,
                  labelColor: Color.fromARGB(255, 138, 19, 15),
                  indicatorColor: Color.fromARGB(255, 138, 19, 15),
                  tabs: [
                  Tab(text: 'Infos'),
                  Tab(text: 'Actus'),
                    Tab(text: 'Calendrier'),
                    Tab(text: 'Effectif'),
                  Tab(text: 'Médias'),
                      
                ]),
              ),
            ),
            backgroundColor: Color.fromARGB(255, 138, 19, 15),
           
            flexibleSpace: Padding(
              padding: EdgeInsets.fromLTRB(0,height/50, width/14,0),
              child: Expanded(
                child: Row(children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                    padding: EdgeInsets.fromLTRB(width/10, width/10, width/10, width/10),
                    child: Container(
                    
                      child: Column(
                        children: [
                          Image.network(widget.url,scale: width/300,),
                          Padding(
                            padding: EdgeInsets.zero,
                            child: Text('${widget.vic} - ${widget.def}', style: numStyle,),
                          )
                        ],
                      ),
                      ),
                  )),
                   Expanded(
                     flex: 3,
                     child: Padding(
                       padding: EdgeInsets.only(top: width/7.8),
                       child: Column(
                      
                       
                         children: [
                           Text("${widget.nom}", textAlign: TextAlign.center,
                           style:topTextStyle,),
                           SizedBox(height: width/41,),
                           Text(widget.club,style: topclubStyle,),
                         ],
                       ),
                     ),
                   ),
                   
                    Expanded(
                   
                     child:  Container(
                       height: 40,
                       alignment: Alignment.centerRight,
                       child: Padding(
                         padding: EdgeInsets.zero,
                         child: IconButton(
                           
                           icon: Icon(Icons.favorite, size: 35,) ,
                           color:  Colors.white ,
                           onPressed: (){
                              
                             Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  LoginScreen()));
                            
                             
                           },),
                       ),
                     )
               
                  
                ),
                ]),
              ),
            ),
              titleTextStyle: TextStyle(color: Colors.white,fontSize: 20,letterSpacing: 2,fontWeight: FontWeight.bold),
            ) ,
          ),
        
        body: TabBarView(children: [
        EquipeInfos(club: widget.club,),
        EquipeActus(club: widget.club),
        EquipeCalendier(club: widget.club,),
        EquipeEffectif(club: widget.club,),
        EquipeMedia(club: widget.club),
        

        
        ],)
      ),
    );
  }
}
