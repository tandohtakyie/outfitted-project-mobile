import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/Screens/collection_screen.dart';
import 'package:outfitted_flutter_mobile/Screens/drawer_screen.dart';

class DrawerCollectionsAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          CollectionScreen(),
        ],
      ),
    );
  }
}
