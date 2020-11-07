import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/home_body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;

  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)..rotateY(isDrawerOpen ? -0.3 : 0),
      duration: Duration(milliseconds: 350),
      child: Scaffold(
        appBar: buildAppBar(),
        body: HomeBody(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: isDrawerOpen
          ? IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                setState(() {
                  xOffset = 0;
                  yOffset = 0;
                  scaleFactor = 1;
                  isDrawerOpen = false;
                });
              },
            )
          : IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white70,
              ),
              onPressed: () {
                setState(() {
                  xOffset = 230;
                  yOffset = 150;
                  scaleFactor = 0.6;
                  isDrawerOpen = true;
                });
              },
            ),
    );
  }
}
