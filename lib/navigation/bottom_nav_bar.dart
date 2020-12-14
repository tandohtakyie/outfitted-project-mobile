import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/screens/account_screen.dart';
import 'package:outfitted_flutter_mobile/screens/home_screen.dart';
import 'package:outfitted_flutter_mobile/screens/search_screen.dart';
import 'package:outfitted_flutter_mobile/screens/shopping_cart_screen.dart';
import 'package:outfitted_flutter_mobile/screens/wishlist_screen.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentScreenIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    SearchScreen(),
    WishlistScreen(),
    ShoppingCartScreen(),
    AccountScreen(),
  ];

  void displayTabbedScreen(int index){
    setState(() {
      _currentScreenIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentScreenIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: kBackgroundOutFitted,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(
            size: 26
          ),
          onTap: displayTabbedScreen,
          currentIndex: _currentScreenIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.white.withOpacity(0.8),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.white.withOpacity(0.8),
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.white.withOpacity(0.8),
              ),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white.withOpacity(0.8),
              ),
              label: 'Shopping Bag',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                color: Colors.white.withOpacity(0.8),
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}