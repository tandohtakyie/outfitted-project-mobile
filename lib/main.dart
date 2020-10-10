import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/Screens/sign_in_screen.dart';
import 'package:outfitted_flutter_mobile/Screens/splash_screen.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

import 'Screens/drawer_screen.dart';
import 'Screens/home_screen.dart';
import 'components/drawer_animation.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OutFitted',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black.withOpacity(0.5), fontFamily: "Muli"),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      // home: DrawerAnimation(),
    );
  }
}