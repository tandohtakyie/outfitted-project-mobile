import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class WishlistScreen extends StatefulWidget {
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOutFittedCustomAppBar(
          title: 'WishList',
          customIcon: Icon(Icons.search),
      ),
      backgroundColor: kBackgroundOutFitted,
      body: Center(
        child: Text('This is wishlist screen!'),
      ),
    );
  }
}
