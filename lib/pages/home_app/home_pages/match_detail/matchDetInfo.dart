import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MatchDetInfo extends StatefulWidget {
  final String domicile;
  final String visiteur;
  final Timestamp horaire;
  const MatchDetInfo({ Key? key, required this.domicile, required this.visiteur , required this.horaire}) : super(key: key);

  @override
  State<MatchDetInfo> createState() => _MatchDetInfoState();
}

class _MatchDetInfoState extends State<MatchDetInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}