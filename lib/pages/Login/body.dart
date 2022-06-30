import 'package:fabb/pages/Login/loginform.dart';
import 'package:fabb/pages/sign_up/sign_up_form.dart';
import 'package:fabb/pages/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10), // 4%
                 Text(
                'LOGIN',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.10),
              ),
              SizedBox(height: 15),
              Text(
                'connectez-vous \navec votre email et votre mot de passe',
                textAlign: TextAlign.center,
              ),
                SizedBox(height: 80),
                LoginForm(),
                SizedBox(height: 20),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Vous n'avez pas de compte?  ",
                    style: TextStyle(fontSize: 13.5,
                    fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpScreen())),
                    child: Text(
                      "Inscrivez-vous!",
                      style: TextStyle(
                        fontSize: 13.5,
                        color: Color(0xFFFF7643),
                      ),
                    ),
                  )
                ],
              )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
