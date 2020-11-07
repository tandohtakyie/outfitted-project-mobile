import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/Screens/forgot_password_screen.dart';
import 'package:outfitted_flutter_mobile/components/default_button.dart';
import 'package:outfitted_flutter_mobile/components/drawer_home_animation.dart';
import 'package:outfitted_flutter_mobile/components/form_error.dart';
import 'package:outfitted_flutter_mobile/dialogbox/errorDialog.dart';
import 'package:outfitted_flutter_mobile/dialogbox/loadingDialog.dart';
import 'package:outfitted_flutter_mobile/firebase/firebase_config.dart';
import 'package:outfitted_flutter_mobile/style/constants.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

import 'custom_textfield_icon.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // String email;
  // String password;

  bool remember = false;

  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              Flexible(child: buildEmailTextFormField(),),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Flexible(child: buildPasswordTextFormField(),),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text(
                "Remember me",
                style: TextStyle(),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new ForgotPasswordScreen()));
                },
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          FormError(errors: errors),
          SizedBox(
            height: 20,
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                email.text.isNotEmpty && password.text.isNotEmpty
                    ? signInCustomer()
                    : showDialog(
                        context: context,
                        builder: (c) {
                          return ErrorAlertDialog(
                            message: "Login Invalid ",
                          );
                        });
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailTextFormField() {
    return TextFormField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      // onSaved: (newValue) => email = newValue,
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

  TextFormField buildPasswordTextFormField() {
    return TextFormField(
      controller: password,
      obscureText: true,
      //onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
        } else if (value.length < 8 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
        }
        return null;
      },
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
    );
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  void signInCustomer() async {
    showDialog(
        context: context,
        builder: (c) {
          return LoadingAlertDialog(
            message: "Logging in, Please wait...",
          );
        });

    User firebaseUser;
    await _auth
        .signInWithEmailAndPassword(
            email: email.text.trim(), password: password.text.trim())
        .then((authUser) {
      firebaseUser = authUser.user;
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialog(
              message: error.toString(),
            );
          });
    });
    if (firebaseUser != null) {
      MaterialPageRoute route;
      readData(firebaseUser).then((s) => {
            Navigator.pop(context),
            route = MaterialPageRoute(builder: (c) => DrawerHomeAnimation()),
            Navigator.pushReplacement(context, route),
          });
    }
  }

  Future readData(User fUser) async {
    FirebaseFirestore.instance
        .collection("customers")
        .doc(fUser.uid)
        .get()
        .then((dataSnapshot) async {
      await OutFittedApp.sharedPreferences.setString("uid", dataSnapshot.data()[OutFittedApp.customerUID]);
      await OutFittedApp.sharedPreferences.setString(OutFittedApp.customerEmail, dataSnapshot.data()[OutFittedApp.customerEmail]);
      await OutFittedApp.sharedPreferences.setString(OutFittedApp.customerName, dataSnapshot.data()[OutFittedApp.customerName]);
      await OutFittedApp.sharedPreferences.setString(OutFittedApp.customerAvatarUrl, dataSnapshot.data()[OutFittedApp.customerAvatarUrl]);

      List<String> cartList = dataSnapshot.data()[OutFittedApp.customerCartList].cast<String>();
      await OutFittedApp.sharedPreferences.setStringList(OutFittedApp.customerCartList, cartList);

      // await OutFittedApp.sharedPreferences.setString("uid", dataSnapshot.data[OutFittedApp.customerUID]);
      // await OutFittedApp.sharedPreferences.setString(OutFittedApp.customerEmail, dataSnapshot.data());
      // await OutFittedApp.sharedPreferences.setString(OutFittedApp.customerName, name.text.trim());
      // await OutFittedApp.sharedPreferences.setString(OutFittedApp.customerAvatarUrl, userImageUrl);
      // await OutFittedApp.sharedPreferences.setStringList(OutFittedApp.customerCartList, ["garbageValue"]);
    });
  }
}
