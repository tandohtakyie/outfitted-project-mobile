import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

import 'custom_textfield_icon.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildEmailTextFormField(),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 42,
                vertical: 20,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(color: kPrimaryColor),
                gapPadding: 10,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(
                  color: kPrimaryColor,
                ),
                gapPadding: 10,
              ),
              suffixIcon: CustomTextFieldIcon(
                icon: Icon(
                  Icons.lock_outline,
                  color: kPrimaryColor.withOpacity(0.8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: kPrimaryColor),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            color: kPrimaryColor,
          ),
          gapPadding: 10,
        ),
        suffixIcon: CustomTextFieldIcon(
          icon: Icon(
            Icons.mail_outline,
            color: kPrimaryColor.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
