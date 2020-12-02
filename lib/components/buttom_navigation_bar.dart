import 'package:flutter/material.dart';

class BottomNavigationBar extends StatefulWidget {
  BottomNavigationBar({Key key}) : super(key: key);

  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}
/// This is the private State class that goes with ButtomNavigationBar.
class _BottomNavigationBarState extends State<BottomNavigationBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    //home
    //Search
    //Profile
  ];



  @override
  Widget build(BuildContext context){
    
  }
}