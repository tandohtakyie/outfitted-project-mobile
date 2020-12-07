import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/screens/drawer_screen.dart';
import 'package:outfitted_flutter_mobile/screens/home_screen.dart';

class DrawerHomeAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}
