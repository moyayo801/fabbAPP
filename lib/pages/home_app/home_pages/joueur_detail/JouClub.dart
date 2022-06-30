import 'package:fabb/pages/home_app/home_pages/joueur_detail/jouCrd.dart';
import 'package:flutter/material.dart';

class JoueurClub extends StatefulWidget {
   final List<dynamic> list;
  const JoueurClub({ Key? key, required this.list }) : super(key: key);

  @override
  State<JoueurClub> createState() => _JoueurClubState();
}

class _JoueurClubState extends State<JoueurClub> {
  @override
  Widget build(BuildContext context) {
    widget.list.sort((a, b) {
  return a['Club'].toLowerCase().compareTo(b['Club'].toLowerCase());
});
    return Expanded(
              child: ListView.builder(
                  itemCount: widget.list.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildJouCard(context, widget.list[index]),
              )
    
            );
  }
}