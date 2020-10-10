import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/Screens/forgot_password_screen.dart';
import 'package:outfitted_flutter_mobile/components/no_account_yet.dart';
import 'package:outfitted_flutter_mobile/components/sign_in_form.dart';
import 'package:outfitted_flutter_mobile/components/size_config.dart';
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  FittedBox(
                    child: Image.asset('assets/images/lady_on_couch.png'),
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "OutFitted",
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
                    "Sign in with your email and password \nor register",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SignInForm(),
                  SizedBox(
                    height: 20,
                  ),
                  NoAccountYet(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


