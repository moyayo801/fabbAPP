import 'package:fabb/pages/sign_up/sign_up_form.dart';
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
                SizedBox(height: 40),
                SignUpForm(),
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
