import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Joueur {
late  String Club;
  late String Date;
  late String GS;
  late String Id;
 late  String Nom;
  late String Prenom;
  late bool isSelected;


  Joueur(
      this.Club,
      this.Date,
      this.GS,
      this.Id,
      this.Nom,
      this.Prenom,
      this.isSelected
      );

  // formatting for upload to Firbase when creating the trip
  Map<String, dynamic> toJson() => {
    'Club': Club,
    'Date de naissance': Date,
    'GS': GS,
    'ID': Id,
    'Nom': Nom,
    'Prenom': Prenom,
    'isSelected': isSelected,
  };

  // creating a Trip object from a firebase snapshot
  Joueur.fromSnapshot(DocumentSnapshot snapshot) :
      Club = snapshot['Club'] ?? '',
      Date = snapshot['Date de naissance']?? '',
      GS = snapshot['GS']?? '',
      Id = snapshot['ID']?? '',
      Nom = snapshot['Nom']?? '',
      Prenom = snapshot['Prenom']?? '',
      isSelected = snapshot['isSelected']?? '';

   Joueur.fromDocument(DocumentSnapshot doc) {
   Joueur(
  
      Club = doc.data()!['Club'] ,
      Date = doc.data()!['Date de naissance'],
      GS = doc.data()!['GS'],
      Id = doc.data()!['ID'],
      Nom = doc.data()!['Nom'],
      Prenom = doc.data()!['Prenom'],
      isSelected = doc.data()!['isSelected'],

  );
}

     

}