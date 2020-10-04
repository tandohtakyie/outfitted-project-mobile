import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/Screens/drawer_screen.dart';
import 'package:outfitted_flutter_mobile/Screens/home_screen.dart';

class DrawerAnimation extends StatelessWidget {
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
