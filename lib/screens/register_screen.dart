import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar_v2.dart';
import 'package:outfitted_flutter_mobile/components/rounded_button.dart';
import 'package:outfitted_flutter_mobile/dialog/error_alert_dialog.dart';
import 'package:outfitted_flutter_mobile/firebase/firebase_config.dart';
import 'package:outfitted_flutter_mobile/navigation/bottom_nav_bar.dart';
import 'package:outfitted_flutter_mobile/screens/login_screen.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    displayDialog(String msg) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialog(
              message: msg,
            );
          });
    }

    Future saveCustomerInfo(User fUser) async {
      DateTime now = new DateTime.now();
      FirebaseFirestore.instance
          .collection(OutFittedApp.collectionCustomer)
          .doc(fUser.uid)
          .set({
        "uid": fUser.uid,
        "email": fUser.email,
        "name": name.text.trim(),
        "dateCreated" : now.day.toString() + "-" + now.month.toString()+ "-" + now.year.toString(),
        OutFittedApp.customerCartList: ["garbageValue"],
        OutFittedApp.customerWishList: ["garbageValue"],
      });

      await OutFittedApp.sharedPreferences.setString("uid", fUser.uid);
      await OutFittedApp.sharedPreferences
          .setString(OutFittedApp.customerEmail, fUser.email);
      await OutFittedApp.sharedPreferences
          .setString(OutFittedApp.customerName, name.text.trim());
      await OutFittedApp.sharedPreferences
          .setStringList(OutFittedApp.customerCartList, ["garbageValue"]);
      await OutFittedApp.sharedPreferences
          .setStringList(OutFittedApp.customerWishList, ["garbageValue"]);
    }

    FirebaseAuth _auth = FirebaseAuth.instance;
    void registerCustomer() async {
      if (name.text.isNotEmpty &&
          email.text.isNotEmpty &&
          password.text.isNotEmpty &&
          confirmPassword.text.isNotEmpty) {
        if (password.text == confirmPassword.text) {
          User firebaseUser;
          await _auth
              .createUserWithEmailAndPassword(
                email: email.text.trim(),
                password: password.text.trim(),
              )
              .then((auth) => {firebaseUser = auth.user})
              .catchError((error) {
          //  Navigator.pop(context);
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
            saveCustomerInfo(firebaseUser).then((value) => {
                  Navigator.pop(context),
                  route = MaterialPageRoute(builder: (c) => BottomNavBar()),
                  Navigator.pushNamedAndRemoveUntil(context, '/home', ModalRoute.withName('/register'))
                });
          }
        } else {
          displayDialog('Password do not match...');
        }
      } else {
        displayDialog('Please, fill out all form...');
      }
    }

    return Scaffold(
      appBar: OutFittedCustomAppBarV2(
        title: 'Register',
        customIcon: Icon(Icons.arrow_back),
        appBar: AppBar(),
      ),
      backgroundColor: kBackgroundOutFitted,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldContainer(
                child: TextFormField(
                  controller: name,
                  textInputAction: TextInputAction.next,     // Set 'next' button in keyboard
                  onEditingComplete: () => node.nextFocus(), // Focus next textfield when pressing 'next'
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: kWhiteColor.withOpacity(0.8),
                    ),
                    hintText: 'Your Name',
                    hintStyle: TextStyle(
                      color: kWhiteColor.withOpacity(0.8),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,     // Set 'next' button in keyboard
                  onEditingComplete: () => node.nextFocus(), // Focus next textfield when pressing 'next'
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.alternate_email,
                      color: kWhiteColor.withOpacity(0.8),
                    ),
                    hintText: 'Your Email',
                    hintStyle: TextStyle(
                      color: kWhiteColor.withOpacity(0.8),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextFormField(
                  controller: password,
                  textInputAction: TextInputAction.next,     // Set 'next' button in keyboard
                  onEditingComplete: () => node.nextFocus(), // Focus next textfield when pressing 'next'
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      color: kWhiteColor.withOpacity(0.8),
                    ),
                    suffixIcon: Icon(
                      // todo: onPress --> change textfieldtype (of password) to text (class must be Stateful)
                      Icons.visibility,
                      color: kWhiteColor.withOpacity(0.8),
                    ),
                    hintText: 'Your Password',
                    hintStyle: TextStyle(
                      color: kWhiteColor.withOpacity(0.8),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextFormField(
                  controller: confirmPassword,
                  textInputAction: TextInputAction.done,       // Set 'done' button in keyboard
                  onEditingComplete: () => registerCustomer(), // Invoke method when pressing 'done' button
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      color: kWhiteColor.withOpacity(0.8),
                    ),
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: kWhiteColor.withOpacity(0.8),
                    ),
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(
                      color: kWhiteColor.withOpacity(0.8),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RoundedButton(
                buttonColor: kPrimaryColor,
                buttonText: 'REGISTER',
                press: () {
                  registerCustomer();
                },
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
