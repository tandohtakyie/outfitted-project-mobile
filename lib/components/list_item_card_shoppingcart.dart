import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/counters/cart_item_counter.dart';
import 'package:outfitted_flutter_mobile/firebase/firebase_config.dart';
import 'package:outfitted_flutter_mobile/model/Cart.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';
import 'package:provider/provider.dart';

List<Widget> buildShoppingCartCard({@required Cart cartItem,}) {

  final String image = cartItem.product.productImage,
               productName = cartItem.product.name,
               price = cartItem.product.price.toStringAsFixed(2),
               totalOfItems = cartItem.amountItems.toString();

  return [
    SizedBox(
      width: 88,
      child: AspectRatio(
        aspectRatio: 0.88,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xfff5f6f9),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.asset(image),
          //  child: Image.network(image),
        ),
      ),
    ),
    SizedBox(
      width: 20,
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productName,
          style: TextStyle(
            fontSize: 16,
          ),
          maxLines: 2,
        ),
        SizedBox(
          height: 10,
        ),
        Text.rich(
          TextSpan(
            text: '€$price',
            style: TextStyle(color: kSecondaryColor),
            children: [
              TextSpan(
                text: ' x$totalOfItems',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 15
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ];
}
