import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar.dart';
import 'package:outfitted_flutter_mobile/components/rounded_button.dart';
import 'package:outfitted_flutter_mobile/dialog/error_alert_dialog.dart';
import 'package:outfitted_flutter_mobile/dialog/loading_alert_dialog.dart';
import 'package:outfitted_flutter_mobile/firebase/firebase_config.dart';
import 'package:outfitted_flutter_mobile/navigation/bottom_nav_bar.dart';
import 'package:outfitted_flutter_mobile/screens/register_screen.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class LoginScreen extends StatelessWidget {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future readData(User fUser) async {
      FirebaseFirestore.instance
          .collection("customers")
          .doc(fUser.uid)
          .get()
          .then((dataSnapshot) async {
        await OutFittedApp.sharedPreferences.setString("uid", dataSnapshot.data()[OutFittedApp.customerUID]);
        await OutFittedApp.sharedPreferences.setString(OutFittedApp.customerEmail, dataSnapshot.data()[OutFittedApp.customerEmail]);
        await OutFittedApp.sharedPreferences.setString(OutFittedApp.customerName, dataSnapshot.data()[OutFittedApp.customerName]);

        List<String> cartList = dataSnapshot.data()[OutFittedApp.customerCartList].cast<String>();
        // todo: remove this print() after error (login/register) is fixed
        print("LISTTT " + cartList.length.toString());

        await OutFittedApp.sharedPreferences.setStringList(OutFittedApp.customerCartList, cartList);

      });
    }

    FirebaseAuth _auth = FirebaseAuth.instance;
    void signInCustomer() async {
      showDialog(
          context: context,
          builder: (c) {
        return LoadingAlertDialog(
          message: 'Logging in...',
        );
      });

      User firebaseUser;
      await _auth.signInWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim()
      ).then((authUser){
        firebaseUser = authUser.user;
      }).catchError((error){
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (c) {
              return ErrorAlertDialog(
                message: error.toString(),
              );
            });
      });

      if(firebaseUser != null){
          MaterialPageRoute route;
          readData(firebaseUser).then((s) => {
            Navigator.pop(context),
            route = MaterialPageRoute(builder: (c) => BottomNavBar()),
            Navigator.pushNamedAndRemoveUntil(context, '/home', ModalRoute.withName('/login'))
          });
      }
    }

    return Scaffold(
      appBar: buildOutFittedCustomAppBar(
        title: 'Login',
        customIcon: Icon(Icons.search),
      ),
      backgroundColor: kBackgroundOutFitted,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
              width: MediaQuery.of(context).size.width * 0.8,
                child: Image.asset(
                    'assets/images/lady_on_couch.png',
                  width: 200,
                ),
              ),
              TextFieldContainer(
                child: TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
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
                    hintText: 'Your Password',
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
                buttonText: 'LOGIN',
                press: () {
                  if(email.text.isNotEmpty && password.text.isNotEmpty){
                    signInCustomer();
                  }else{
                    showDialog(
                        context: context,
                        builder: (c) {
                          return ErrorAlertDialog(
                            message: "Please, fill all the fields...",
                          );
                        }
                    );
                  }
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

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.6),
          borderRadius: BorderRadius.circular(30)),
      child: child,
    );
  }
}
