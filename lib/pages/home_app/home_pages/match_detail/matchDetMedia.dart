import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MatchDetMedia extends StatefulWidget {
  final String domicile;
  final String visiteur;
  final Timestamp horaire;
  const MatchDetMedia({ Key? key, required this.domicile, required this.visiteur , required this.horaire}) : super(key: key);

  @override
  State<MatchDetMedia> createState() => _MatchDetMediaState();
}

class _MatchDetMediaState extends State<MatchDetMedia> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}