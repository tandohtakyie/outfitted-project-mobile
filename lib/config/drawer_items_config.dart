import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/drawer_home_animation.dart';

List<Map> drawerItems = [
  {
    'icon': Icons.home,
    'title': 'Home',
    'route': DrawerHomeAnimation(),
  },
  {
    'icon': Icons.shopping_bag,
    'title': 'Collections',
    'route': DrawerHomeAnimation(),
  },
  {
    'icon': Icons.favorite,
    'title': 'Wishlist',
    'route': DrawerHomeAnimation(),
  },
  {
    'icon': Icons.shopping_cart,
    'title': 'Cart',
    'route': DrawerHomeAnimation(),
  },
  {
    'icon': Icons.list_alt,
    'title': 'Orders',
    'route': DrawerHomeAnimation(),
  },
  {
    'icon': Icons.mail,
    'title': 'Inbox',
    'route': DrawerHomeAnimation(),
  },
  {
    'icon': Icons.person,
    'title': 'Account',
    'route': DrawerHomeAnimation(),
  },
];
