import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/no_account_yet.dart';
import 'package:outfitted_flutter_mobile/components/sign_up_form.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome to OutFitted",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Sign up for free \nor log in if you already have an account",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SignUpForm(),
                  SizedBox(
                    height: 20,
                  ),
                  NoAccountYet(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
