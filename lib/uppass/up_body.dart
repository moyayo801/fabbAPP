
import 'package:fabb/uppass/updatePASS.dart';
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
                Text("Changer le mot de passe", style: headingStyle),
                SizedBox(height: 5),
           
                SizedBox(height: 80),
                UpPass(),
                SizedBox(height: 10),

                SizedBox(height: 10),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
