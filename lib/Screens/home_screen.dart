import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/collection_body.dart';
import 'package:outfitted_flutter_mobile/components/drawer_collections_animation.dart';
import 'package:outfitted_flutter_mobile/components/drawer_home_animation.dart';
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
    int _selectedIndex = 0;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    List<Widget> _widgetOptions = [
      DrawerHomeAnimation(),
      DrawerCollectionsAnimation(),
      ];

    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)..rotateY(isDrawerOpen ? -0.3 : 0),
      duration: Duration(milliseconds: 350),
      child: Scaffold(
        appBar: buildAppBar(),
        // body: HomeBody(),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(

            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,

          items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
          ),
          ]
        ),
      )
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
