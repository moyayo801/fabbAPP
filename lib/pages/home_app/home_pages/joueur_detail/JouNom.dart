import 'package:fabb/pages/home_app/home_pages/joueur_detail/jouCrd.dart';
import 'package:flutter/material.dart';

class JoueurNom extends StatefulWidget {
  final List<dynamic> list;
  const JoueurNom({ Key? key, required this.list }) : super(key: key);

  @override
  State<JoueurNom> createState() => _JoueurNomState();
}

class _JoueurNomState extends State<JoueurNom> {
  
  @override
  Widget build(BuildContext context) {
        widget.list.sort((a, b) {
  return a['Nom'].toLowerCase().compareTo(b['Nom'].toLowerCase());
});
    return   Expanded(
              child: ListView.builder(
                  itemCount: widget.list.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildJouCard(context, widget.list[index]),
              )
    
            );
  }
}