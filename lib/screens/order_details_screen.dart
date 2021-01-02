import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar_v2.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String orderID;

  const OrderDetailsScreen({Key key, this.orderID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OutFittedCustomAppBarV2(
        title: 'Account',
        customIcon: Icon(Icons.arrow_back),
        onLeftIconPress: () {
          Navigator.pop(context);
        },
        appBar: AppBar(),
      ),
      backgroundColor: kBackgroundOutFitted,
      body: Center(
        child: Text(
          'this is order details & status'
        ),
      ),
    );
  }
}
