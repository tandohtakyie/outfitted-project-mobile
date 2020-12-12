import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOutFittedCustomAppBar(
          title: 'Shopping cart',
        customIcon: Icon(Icons.search),
      ),
      backgroundColor: kBackgroundOutFitted,
      body: Center(
        child: Text('This is shopping bag screen!'),
      ),
    );
  }
}
