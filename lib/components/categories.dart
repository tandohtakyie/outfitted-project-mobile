import 'package:flutter/material.dart';

Color primaryTheme = Color(0xff012e43);
List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10)),
];

List<Map> categories = [
  {'name': 'T-Shirts', 'iconPath': 'assets/icons/icon_category_tshirt.png'},
  {'name': 'Long Sleeves', 'iconPath': 'assets/icons/icon_category_long_sleeves.png'},
  {'name': 'Pants', 'iconPath': 'assets/icons/icon_category_jeans.png'},
  {'name': 'Shoes', 'iconPath': 'assets/icons/icon_category_sneakers.png'},
  {'name': 'Sweaters', 'iconPath': 'assets/icons/icon_category_sweater.png'},
  {'name': 'Hats', 'iconPath': 'assets/icons/icon_category_hat.png'},
  {'name': 'Backpacks', 'iconPath': 'assets/icons/icon_category_backpack.png'},
  {'name': 'Accessories', 'iconPath': 'assets/icons/icon_category_accessories.png'},
];
