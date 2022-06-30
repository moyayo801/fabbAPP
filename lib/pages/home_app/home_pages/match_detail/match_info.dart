import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fabb/pages/home_app/home_pages/match_detail/matchDetInfo.dart';
import 'package:fabb/pages/home_app/home_pages/match_detail/matchDetMedia.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MatchInfo extends StatefulWidget {
  final String dom;
  final String vis;
  final int scoDom;
  final int scoVis;
  final Timestamp horaire;
  const MatchInfo({ Key? key, required this.dom, required this.vis, required this.scoDom, required this.scoVis , required this.horaire}) : super(key: key);

  @override
  State<MatchInfo> createState() => _MatchInfoState();
}

class _MatchInfoState extends State<MatchInfo> {
    List _DOM = [];
    List _VIS = [];
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

    var dataDom=  await FirebaseFirestore.instance.collection('Equipe').where("Club", isEqualTo: widget.dom).get();
    var dataVis =  await FirebaseFirestore.instance.collection('Equipe').where("Club", isEqualTo: widget.vis).get();
   
   setState(() {
     _DOM =dataDom.docs;
     _VIS = dataVis.docs;
   });
   
    return "complete";
  }
    
var topTextStyle =
  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white);
 var topclubStyle =
  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87);
 
  var numStyle =
  GoogleFonts.inter(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black);


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
             preferredSize: Size.fromHeight(220.0),
          child: AppBar(
            backgroundColor: Color.fromARGB(255, 138, 19, 15),
            flexibleSpace: Column(
              children: [
                    Expanded(
                      flex: 2,
                  child:Container(
                    alignment: Alignment.bottomCenter,
                    color: Color.fromARGB(255, 138, 19, 15),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            )),
                              Expanded(
                                flex: 3,
                          child: Container(
                            )),
                              Expanded(
                                flex: 10,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                          
                            child:   Text("${widget.dom} VS ${widget.vis}", style: topTextStyle,),
                            )),
                              Expanded(
                                flex: 2,
                          child: Container(
                            )),
                              Expanded(
                                flex: 4,
                          child: Container(
                            alignment: Alignment.topCenter,
                  )),
                            
                      ],
                    ),
                    ),
                  ) ),
                Expanded(
                  flex: 3,
                  child:Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(17.0),
                              child: _DOM.isNotEmpty ? Image.network("${_DOM[0]['URL']}", scale: 0.2,) : null,
                            ),
                            )),
                              Expanded(
                                flex: 3,
                          child: Container(
                            
                            alignment: Alignment.center,
                         
                            child: Text("${widget.scoDom}", style: numStyle,),
                            )),
                              Expanded(
                                flex: 4,
                          child: Container(
                            alignment: Alignment.center,
                          
                            child:   Text("Terminé", style: topclubStyle,),
                            )),
                              Expanded(
                                flex: 2,
                          child: Container(
                            alignment: Alignment.center,
                          
                            child:   Text("${widget.scoVis}", style: numStyle,),
                            )),
                              Expanded(
                                flex: 4,
                          child: Container(
                            alignment: Alignment.topCenter,
                            child:Padding(
                              padding: const EdgeInsets.all(17.0),
                              child: _VIS.isNotEmpty ? Image.network("${_VIS[0]['URL']}", scale: 0.5,) : null,
                            ) ,)),
                            
                      ],
                    ),
                  ) ),
                  Expanded(child: Container(color: Colors.amber,
                  child:PreferredSize(
              preferredSize: Size.fromHeight(20.0),
              child: ColoredBox(
                color: Color.fromARGB(255, 238, 238, 238),
                child: const TabBar(
                  labelPadding: EdgeInsets.zero,
                  labelColor: Color.fromARGB(255, 138, 19, 15),
                  indicatorColor: Color.fromARGB(255, 138, 19, 15),
                  tabs: [
                  Tab(text: 'Infos'),
                  Tab(text: 'Médias'),
                      
                ]),
              ),
            ),
                  ))
              ],
            ),
          
          ),
        ),
        body: TabBarView(children: [

        MatchDetInfo(domicile: widget.dom, visiteur: widget.vis, horaire: widget.horaire),
        MatchDetMedia(domicile: widget.dom, visiteur: widget.vis, horaire: widget.horaire)
        
        ],),
      ),
    );
  }
}