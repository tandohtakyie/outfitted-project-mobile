import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar.dart';
import 'package:outfitted_flutter_mobile/components/rounded_button.dart';
import 'package:outfitted_flutter_mobile/firebase/firebase_config.dart';
import 'package:outfitted_flutter_mobile/navigation/bottom_nav_bar.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOutFittedCustomAppBar(
        title: 'Settings',
        customIcon: Icon(Icons.search),
      ),
      backgroundColor: kBackgroundOutFitted,
      body: Center(
        child: RoundedButton(
          buttonText: 'LOGOUT',
          buttonColor: kPrimaryColor,
          press: () async {
            OutFittedApp.auth.signOut().then((c) {
                Route route = MaterialPageRoute(builder: (c) => BottomNavBar());
                Navigator.pushNamedAndRemoveUntil(context, '/home', ModalRoute.withName('/settings'));
            });
          },
        ),
      ),
    );
  }
}
