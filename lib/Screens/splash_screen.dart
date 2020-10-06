import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/Screens/drawer_screen.dart';
import 'package:outfitted_flutter_mobile/Screens/sign_in_screen.dart';
import 'package:outfitted_flutter_mobile/components/drawer_animation.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    displaySplash();
  }

  void displaySplash() {
    Timer(Duration(seconds: 3), () {
      Route route = MaterialPageRoute(builder: (_) => SignInScreen());
      Navigator.pushReplacement(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: FittedBox(
          child: Image.asset('assets/images/splash.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
