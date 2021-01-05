import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar_v2.dart';
import 'package:outfitted_flutter_mobile/components/rounded_button.dart';
import 'package:outfitted_flutter_mobile/firebase/firebase_config.dart';
import 'package:outfitted_flutter_mobile/screens/login_screen.dart';
import 'package:outfitted_flutter_mobile/screens/profile_screen.dart';
import 'package:outfitted_flutter_mobile/screens/register_screen.dart';
import 'package:outfitted_flutter_mobile/screens/search_product_screen.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OutFittedCustomAppBarV2(
        title: 'Account',
        customIcon: Icon(Icons.search),
        appBar: AppBar(),
        onLeftIconPress: () {
          Route route = MaterialPageRoute(builder: (c) => SearchProductScreen());
          Navigator.push(context, route);
        },
      ),
      backgroundColor: kBackgroundOutFitted,
      body: OutFittedApp.auth.currentUser != null
          ? ProfileScreen()
          : buildLoginAndRegisterPane(context),
    );
  }

  Center buildLoginAndRegisterPane(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedButton(
            buttonText: 'LOGIN',
            buttonColor: kPrimaryColor,
            press: () {
              Route route = MaterialPageRoute(builder: (c) => LoginScreen());
              Navigator.push(context, route);
            },
          ),
          SizedBox(
            height: 15,
          ),
          RoundedButton(
            buttonText: 'REGISTER',
            buttonColor: kPrimaryColor.withOpacity(0.8),
            press: () {
              Route route = MaterialPageRoute(builder: (c) => RegisterScreen());
              Navigator.push(context, route);
            },
          ),
        ],
      ),
    );
  }
}
