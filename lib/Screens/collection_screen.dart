import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/collection_body.dart';

class CollectionScreen extends StatefulWidget {
  @override
  _CollectionScreenState createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {

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
        body: CollectionBody(),
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
