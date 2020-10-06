import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/sign_in_form.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "OutFitted",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Sign in with your email and password \nor register",
                    textAlign: TextAlign.center,
                  ),
                  SignInForm()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
