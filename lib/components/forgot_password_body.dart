import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/screens/sign_in_screen.dart';
import 'package:outfitted_flutter_mobile/components/custom_textfield_icon.dart';
import 'package:outfitted_flutter_mobile/components/default_button.dart';
import 'package:outfitted_flutter_mobile/components/form_error.dart';
import 'package:outfitted_flutter_mobile/components/no_account_yet.dart';
import 'package:outfitted_flutter_mobile/style/constants.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class ForgotPasswordBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Text(
                "Forgot Password",
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Muli"),
              ),
              Text(
                "Please enter your email and we will send \nyou a link to return to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30,),
              ForgotPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey= GlobalKey<FormState>();
  List<String> errors = [];
  String email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                setState(() {
                  errors.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value.isEmpty && !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kEmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              labelStyle: TextStyle(),
              hintStyle: TextStyle(),
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
          ),
          SizedBox(height: 30,),
          FormError(errors: errors,),
          SizedBox(height: 30,),
          DefaultButton(
            text: "Continue",
            press: (){
              if(_formKey.currentState.validate()){
                //just do want you want
              }
            },
          ),
          SizedBox(height: 30,),
          NoAccountYet(),
        ],
      ),
    );
  }
}
