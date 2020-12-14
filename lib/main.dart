import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/navigation/bottom_nav_bar.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase/firebase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  OutFittedApp.auth = FirebaseAuth.instance;
  OutFittedApp.firestore = FirebaseFirestore.instance;
  OutFittedApp.sharedPreferences = await SharedPreferences.getInstance();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'OutFitted',
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white.withOpacity(0.5), fontFamily: "Muli",
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BottomNavBar(),
    );
  }
}
