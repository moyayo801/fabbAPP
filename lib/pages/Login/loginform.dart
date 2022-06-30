import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fabb/auth.dart';
import 'package:fabb/pages/home_app/home_2.dart';
import 'package:fabb/pages/home_app/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../custom_surfix_icon.dart';
import '../../default_button.dart';
import '../../form_error.dart';
import '../../constants.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final Auth auth = Auth();
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String nom;
  late String prenom;
  late String password;
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
  final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  @override
  Widget build(BuildContext context) {
         var size,height,width;
         size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed:  () {
      Navigator.pop(context);
    },
  );
   AlertDialog alert = AlertDialog(
    title: Text("Erreur!"),
    content: Text("Utilisateur pas trouver"),
    actions: [
      cancelButton,
   
    ],
  );
    return Form(
      key: _formKey,
      child: Column(
        children: [
         emailMethod(),
          SizedBox(height: 30),
         MotpassMethod(),
          SizedBox(height: 30),
          FormError(errors: errors),
          SizedBox(height: 40),
            DefaultButton(
            text: "Se connecter",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
             
               User? user = await auth.login(email: email, password: password, context: context);
      
               if (user != null) {
      Navigator.pop(context);
                      return    Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
        builder: (BuildContext context) => const Home2(),
          ),
        );
               }else{
                             return    showDialog(
          context: context,
          builder: (BuildContext context) {
        return alert;
          },
        );
               }
      
      
      
      
      
      
            },
          ),
        ],
      ),
    );
  }

 TextFormField MotpassMethod() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty &&
            errors.contains("veulliez Entez Votre mot de pass")) {
          setState(() {
            errors.remove("veulliez Entez Votre mot de pass");
          });
        } else if (value.length >= 8 &&
            errors.contains("veulliez Entez Votre mot de pass")) {
          setState(() {
            errors.remove("veulliez Entez Votre mot de pass");
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty &&
            !errors.contains("veulliez Entez Votre mot de pass")) {
          setState(() {
            errors.add("veulliez Entez Votre mot de pass");
          });
        } else if (value.length < 8 &&
            !errors.contains("veulliez Entez Votre mot de pass")) {
          setState(() {
            errors.add("veulliez Entez Votre mot de pass");
          });
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Mot De Pass",
        hintText: "Entez votre Mot De Pass",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: InputAREA(
          svgIcon: 'asset/Lock.svg',
        ),
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

  TextFormField emailMethod() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty &&
            !errors.contains("veulliez Entez Votre Email")) {
          setState(() {
            errors.remove("veulliez Entez Votre Email");
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains("veulliez Entez Votre Email")) {
          setState(() {
            errors.remove("veulliez Entez Votre Email");
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains("veulliez Entez Votre Email")) {
          setState(() {
            errors.add("veulliez Entez Votre Email");
          });
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains("veulliez Entez Votre Email")) {
          setState(() {
            errors.add("veulliez Entez Votre Email");
          });
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Entez votre Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: InputAREA(
          svgIcon: 'asset/Mail.svg',
        ),
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
}

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => FormErrorText(error: errors[index])),
    );
  }

  // ignore: non_constant_identifier_names
  Row FormErrorText({required String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "asset/Error.svg",
          height: 14,
          width: 14,
        ),
        SizedBox(width: 10),
        Text(error),
      ],
    );
  }
}

class InputAREA extends StatelessWidget {
  const InputAREA({
    Key? key,
    required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
      child: SvgPicture.asset(
        svgIcon,
        height: 18,
      ),
    );
  }
}
