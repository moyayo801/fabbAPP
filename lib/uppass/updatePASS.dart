import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fabb/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants.dart';
import '../../../../custom_surfix_icon.dart';
import '../../../../default_button.dart';

class UpPass extends StatefulWidget {
  const UpPass({ Key? key }) : super(key: key);

  @override
  State<UpPass> createState() => _UpPassState();
}

class _UpPassState extends State<UpPass> {
  TextFormField buildoldPassFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => oldpassword = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Mot de passe actuel",
        hintText: "Enter votre mot de passe actuel",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "asset/Lock.svg"),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Color.fromARGB(255, 170, 169, 169)),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Color.fromARGB(255, 170, 169, 169)),
          gapPadding: 10,
        ),
      ),
    );
  }
   TextFormField buildnewPassFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => newpassword = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Nouveau mot de passe",
        hintText: "Enter votre nouveau mot de passe",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "asset/Lock.svg"),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Color.fromARGB(255, 170, 169, 169)),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Color.fromARGB(255, 170, 169, 169)),
          gapPadding: 10,
        ),
      ),
    );
  }
    final _formKey = GlobalKey<FormState>();
  late String oldpassword;
  late String prenom;
  late String newpassword;
  // ignore: non_constant_identifier_names
  late String conform_password;
  bool remember = false;
  final List<String> errors = [];

  void addError({required String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({required String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
  CollectionReference users = FirebaseFirestore.instance.collection('Utilisateurs');
 getUsers() async {

    var data=  await FirebaseFirestore.instance.collection('Utilisateurs').where('UID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).limit(1).get();
data.docs.forEach((element) {
  users
    .doc(element.id)
    .update({'Mot de passe': '${newpassword}'})
    .then((value) => print("User Updated"))
    .catchError((error) => print("Failed to update user: $error"));
});
  }
  
  
  Future<bool> _changePassword(String email ,String currentPassword, String newPassword) async {
final user = await FirebaseAuth.instance.currentUser;
final cred = EmailAuthProvider.credential(
    email: email, password: currentPassword);
bool corr = false;
user!.reauthenticateWithCredential(cred).then((value) {
  user.updatePassword(newPassword).then((_) {
    getUsers();
    corr=true;
    
  }).catchError((error) {
   corr = false;
  });
}).catchError((err) {
  corr = false;
});
return corr;
}  

  @override
  Widget build(BuildContext context) {



 
Widget cancelButton = TextButton(
    child: Text("ok"),
    onPressed:  () {
      Navigator.pop(context);
    },
  );


  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Succès!"),
    content: Text("mot de passe mis à jour avec succès"),
    actions: [
      cancelButton,

    ],
  );
















 final Auth auth = Auth();

    String email = auth.emaill();
    return Form(
      key: _formKey,
      child: Column(children: [
         buildoldPassFormField(),
           SizedBox(height: 30),
           buildnewPassFormField(),
            SizedBox(height: 40),
          DefaultButton(
            text: "Changer le mot de passe",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
              _changePassword(email, oldpassword, newpassword).then((value) =>  
                   showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  )
              );
              
              
            
 },
          ),
    ],)
    );
  }
    
  
}