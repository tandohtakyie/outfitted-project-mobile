import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:outfitted_flutter_mobile/components/custom_textfield_icon.dart';
import 'package:outfitted_flutter_mobile/components/default_button.dart';
import 'package:outfitted_flutter_mobile/components/drawer_animation.dart';
import 'package:outfitted_flutter_mobile/components/form_error.dart';
import 'package:outfitted_flutter_mobile/dialogbox/errorDialog.dart';
import 'package:outfitted_flutter_mobile/dialogbox/loadingDialog.dart';
import 'package:outfitted_flutter_mobile/firebase/firebase_config.dart';
import 'package:outfitted_flutter_mobile/style/constants.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  //
  // String name;
  // String email;
  // String password;
  // String confirm_password;

  File _imageFile;

  String userImageUrl = "";

  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              _selectAndPickImage();
            },
            child: CircleAvatar(
              radius: _screenWidth * 0.15,
              backgroundColor: Colors.white,
              backgroundImage:
                  _imageFile == null ? null : FileImage(_imageFile),
              child: _imageFile == null
                  ? Icon(
                      Icons.add_a_photo,
                      size: _screenWidth * 0.15,
                      color: kPrimaryColor,
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildNameFormField(),
          SizedBox(
            height: 20,
          ),
          buildEmailFormField(),
          SizedBox(
            height: 20,
          ),
          buildPasswordFormField(),
          SizedBox(
            height: 20,
          ),
          buildConfirmPasswordFormField(),
          FormError(
            errors: errors,
          ),
          SizedBox(
            height: 20,
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                // create account
                // print("Name: " + name);
                // print("Email: " + email);
                //print("Password: " + password);
                //print("Password Confirm: " + password);
                uploadAndSaveImage();
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      controller: name,
      keyboardType: TextInputType.name,
      //onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        } else if (value.length >= 1) {
          setState(() {
            removeError(error: kNameNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          setState(() {
            errors.add(kNameNullError);
          });
        } else if (value.length < 1) {
          setState(() {
            errors.add(kNameNullError);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Enter your Name",
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
            Icons.person_outline,
            color: kPrimaryColor.withOpacity(0.8),
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      // onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          setState(() {
            removeError(error: kInvalidEmailError);
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

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: password,
      obscureText: true,
      //onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kPassNullError);
        }
        //password = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
        } else if (value.length < 8) {
          addError(error: kShortPassError);
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

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      controller: confirm_password,
      obscureText: true,
      //onSaved: (newValue) => confirm_password = newValue,
      onChanged: (value) {
        if (password == confirm_password) {
          removeError(error: kMatchPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "";
        } else if (password != confirm_password) {
          addError(error: kMatchPassError);
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
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

  Future<void> _selectAndPickImage() async {
    // ignore: deprecated_member_use
    _imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
  }

  Future<void> uploadAndSaveImage() async {
    if (_imageFile == null) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialog(
              message: "Please select an image",
            );
          });
    } else {
      password.text == confirm_password.text
          ? name.text.isNotEmpty &&
                  email.text.isNotEmpty &&
                  password.text.isNotEmpty &&
                  confirm_password.text.isNotEmpty
              ? uploadToFirebaseStorage()
              : displayDialog("Please fill out all form...")
          : displayDialog("Password do not match.");
    }
  }

  displayDialog(String msg) {
    showDialog(
        context: context,
        builder: (c) {
          return ErrorAlertDialog(
            message: msg,
          );
        });
  }

  uploadToFirebaseStorage() async {
    showDialog(
        context: context,
        builder: (c) {
          return LoadingAlertDialog(
            message: "Registering account, please wait....",
          );
        });

    String imageFileName = DateTime.now().millisecondsSinceEpoch.toString();

    UploadTask uploadTask =
        FirebaseStorage.instance.ref().child(imageFileName).putFile(_imageFile);

    TaskSnapshot taskSnapshot = await uploadTask;

    await taskSnapshot.ref.getDownloadURL().then((urlImage) => {
          userImageUrl = urlImage,
          _registerCustomer(),
        });
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  void _registerCustomer() async {
    User firebaseUser;
    await _auth
        .createUserWithEmailAndPassword(
            email: email.text.trim(),
            password: password.text.trim())
        .then((auth) => {
              firebaseUser = auth.user,
            })
        .catchError((error) {
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
      saveCustomerInfoToFireStore(firebaseUser).then((value) => {
            Navigator.pop(context),
            route = MaterialPageRoute(builder: (c) => DrawerAnimation()),
            Navigator.pushReplacement(context, route),
          });
    }
  }

  Future saveCustomerInfoToFireStore(User fUser) async {
    // ignore: deprecated_member_use
    Firestore.instance.collection("customers").doc(fUser.uid).set({
      "uid": fUser.uid,
      "email": fUser.email,
      "name": name.text.trim(),
      "url": userImageUrl,
    });

    await OutFittedApp.sharedPreferences.setString("uid", fUser.uid);
    await OutFittedApp.sharedPreferences
        .setString(OutFittedApp.customerEmail, fUser.email);
    await OutFittedApp.sharedPreferences
        .setString(OutFittedApp.customerName, name.text.trim());
    await OutFittedApp.sharedPreferences
        .setString(OutFittedApp.customerAvatarUrl, userImageUrl);
    await OutFittedApp.sharedPreferences
        .setStringList(OutFittedApp.customerCartList, ["garbageValue"]);
  }
}
