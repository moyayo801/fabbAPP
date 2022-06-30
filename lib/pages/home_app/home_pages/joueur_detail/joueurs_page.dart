// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fabb/pages/home_app/home_pages/joueur_detail/JouClub.dart';
import 'package:fabb/pages/home_app/home_pages/joueur_detail/JouNom.dart';
import 'package:fabb/pages/home_app/home_pages/joueur_detail/jouCrd.dart';
import 'package:fabb/pages/home_app/home_pages/joueur_detail/joueur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Login/login.dart';



class JoueursPage extends StatefulWidget {
  @override
  _JoueursPageState createState() => _JoueursPageState();
}

class _JoueursPageState extends State<JoueursPage> {
  TextEditingController _searchController = TextEditingController();
      final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
   

  late Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];


  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getUsersPastTripsStreamSnapshots();
  }


  _onSearchChanged() {
    searchResultsList();
  }
    getUsersPastTripsStreamSnapshots() async {

    var data=  await FirebaseFirestore.instance.collection('Joueur').get();

   
   setState(() {
     _allResults =data.docs;
   });

       searchResultsList();
    return "complete";
  }

  searchResultsList() {
    var showResults = [];

    if(_searchController.text != "") {
      for(var tripSnapshot in _allResults){
        var Nom = Joueur.fromDocument(tripSnapshot).Nom.toLowerCase();
        var Prenom = Joueur.fromDocument(tripSnapshot).Prenom.toLowerCase();

        if(Nom.contains(_searchController.text.toLowerCase()) || Prenom.contains(_searchController.text.toLowerCase())) {
          showResults.add(tripSnapshot);
        }
      }

    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultsList = showResults;
    });
  }



  Widget build(BuildContext context) {
    var size,height,width;
         size = MediaQuery.of(context).size;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
     var titeStyle =
  GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600,);

        final style = _searchController.text.isEmpty ? styleHint : styleActive;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
         appBar: PreferredSize(
            preferredSize: Size.fromHeight(height/3.5),
            child: AppBar(
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
             title: Text("JOUEUR", style: titeStyle,),
              // ignore: prefer_const_constructors
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(20.0),
                child: ColoredBox(
                  color: Color.fromARGB(255, 238, 238, 238),
                  child: const TabBar(
                    physics: NeverScrollableScrollPhysics(),
                    labelPadding: EdgeInsets.zero,
                    labelColor: Color.fromARGB(255, 138, 19, 15),
                    indicatorColor: Color.fromARGB(255, 138, 19, 15),
                    tabs: [
                    Tab(text: 'Nom'),
                    Tab(text: 'Club'),
                        
                  ]),
                ),
              ),
              backgroundColor: Color.fromARGB(255, 138, 19, 15),
             
              flexibleSpace: Expanded(
                child: Container(
                  alignment: Alignment.center,
        height: 40,
        margin: const EdgeInsets.fromLTRB(16, 100, 16, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(color: Colors.black26),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child:TextField(
                controller: _searchController,
                 decoration: InputDecoration(
            icon: Icon(Icons.search, color: style.color),
            suffixIcon: _searchController.text.isNotEmpty
                ? GestureDetector(
                    child: Icon(Icons.close, color: style.color),
                    onTap: () {
                      _searchController.clear();
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  )
                : null,
            hintText: "Rechercher un joueur",
            hintStyle: style,
            border: InputBorder.none,
          ),
              ) ,
    ),
              ),
                titleTextStyle: TextStyle(color: Colors.white,fontSize: 20,letterSpacing: 2,fontWeight: FontWeight.bold),
              ) ,
            ),
      body:
      TabBarView(
        children: [
        
          JoueurNom(list: _resultsList),
          JoueurClub(list: _resultsList)
          
    
          
          ],)
       /* Column(children: [
    
    
    
            Expanded(
              child: ListView.builder(
                  itemCount: _resultsList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildJouCard(context, _resultsList[index]),
              )
    
            ),
      ]) */
      ),
    );
  }
}


      






















































/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fabb/constants.dart';
import 'package:fabb/pages/home_app/home_pages/joueur_detail/joueur.dart';
import 'package:fabb/pages/home_app/home_pages/joueur_detail/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Login/login.dart';
import 'joueur-detail.dart';

class JoueursPage extends StatefulWidget {
  const JoueursPage({Key? key}) : super(key: key);

  @override
  _JoueursPageState createState() => _JoueursPageState();
}

class _JoueursPageState extends State<JoueursPage> {
  TextEditingController _searchController = TextEditingController(); 
  late Future resultsLoaded;
  List _allResults = [];
    List _resultsList = [];
 late List joueurr;


  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    joueurr = _allResults;
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }


    @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = joueurs();
  }

  _onSearchChanged() {
searchResultsList();
  }

searchResultsList(){

var showResults =[];
if (_searchController.text != "" ) {
  for (var joueurSnapshot in _allResults) {
    var Nom = Joueur.fromSnapshot(joueurSnapshot).Nom.toLowerCase();

if (Nom.contains(_searchController.text.toLowerCase())) {
  showResults.add(joueurSnapshot);
}



  }
  
} else {
  showResults = List.from(_allResults);
}

  setState(() {
    _resultsList = showResults;
  });
}



 joueurs() async {
      
    var data=  await FirebaseFirestore.instance.collection('Joueur').get();

   
   setState(() {
     _allResults =data.docs;
   });

       searchResultsList();
    return "complete";
    }


String query = '';

  var bottomTextStyle =
  GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400);

var topTextStyle =
  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF2C53B1));

    var titeStyle =
  GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600,);

  void searchJoueur(String query){
       final joueurr = _allResults.where((element) {
         final club = element['Nom'].toString().toLowerCase();
         final search = query.toLowerCase();
           
           return club.contains(search);
       }).toList();

       setState(() {
         this.query = query;
         this.joueurr = joueurr;
       });
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 138, 19, 15),
        title: Text("JOUEURS", style: titeStyle,),
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
      ),
      body: Column(
        children: [
               SearchWidget(
                 text: query, 
                 onChanged: searchJoueur, 
                 hintText: "Rechaercher un joueur"),

Expanded(
              child: ListView.builder(
            
                itemCount: joueurr.length,
                itemBuilder: (context, index){
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
                                     Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>  JoueurDetails(joueurr[index]['Nom'], joueurr[index]['Prenom'],joueurr[index]['Club'],joueurr[index]['Numero'],joueurr[index]['Poste'])));
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
                                             Text("${joueurr[index]['Nom']} ${joueurr[index]['Prenom']}",style:topTextStyle),
                                             SizedBox(height: 9,),
                                             Text("${joueurr[index]['Club']}",style: bottomTextStyle,)
                                           ],
                                         ),
                                       )),
                             
                                     Expanded(
                                      flex: 2,
                                       child: Container(
                                        
                                         height: 60,
                                         alignment: Alignment.center,
                                                                 
                                         child: Image.asset("asset/equipes/${joueurr[index]['Club']}.jpg", scale: 2,
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
                    
                    
                    
                     
                     
                       
                     
                  
                },
              ),
            ),








/*           StreamBuilder<QuerySnapshot>(stream: joueur,builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.hasError){
              return Text("wrong");
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return Text("Loading");
            }
            final data = snapshot.requireData;
            return Expanded(
              child: ListView.builder(
            
                itemCount: data.size,
                itemBuilder: (context, index){
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
                                     Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>  JoueurDetails(data.docs[index]['Nom'], data.docs[index]['Prenom'],data.docs[index]['Club'],data.docs[index]['Numero'],data.docs[index]['Poste'])));
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
                                             Text("${data.docs[index]['Nom']} ${data.docs[index]['Prenom']}",style:topTextStyle),
                                             SizedBox(height: 9,),
                                             Text("${data.docs[index]['Club']}",style: bottomTextStyle,)
                                           ],
                                         ),
                                       )),
                             
                                     Expanded(
                                      flex: 2,
                                       child: Container(
                                        
                                         height: 60,
                                         alignment: Alignment.center,
                                                                 
                                         child: Image.asset("asset/equipes/${data.docs[index]['Club']}.jpg", scale: 2,
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
                    
                    
                    
                     
                     
                       
                     
                  
                },
              ),
            );
          },
          ), */
        ],
      ) ,
    );
   
  } 

}
 */