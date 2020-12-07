import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/navigation/bottom_nav_bar.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
              bodyColor: Colors.black.withOpacity(0.5), fontFamily: "Muli"),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BottomNavBar(),
    );
  }
}
