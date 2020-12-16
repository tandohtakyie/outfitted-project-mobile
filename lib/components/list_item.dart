
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/model/Cart.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

Row ListItem({Cart cartItem,}) {
  return Row(
    children: [
      SizedBox(
        width: 88,
        child: AspectRatio(
          aspectRatio: 0.88,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFFF5F6F9),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(cartItem.product.productImage), /*todo: replace with image of product*/
          ),
        ),
      ),
      SizedBox(width: 20),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cartItem.product.name,
            style: TextStyle(fontSize: 16, color: Colors.black),
            maxLines: 2,
          ),
          const SizedBox(height: 10),
          Text.rich(TextSpan(
              text: "\€${cartItem.product.price}", /*todo: replace with price of product*/
              style: TextStyle(color: Colors.indigo),
              children: [
                TextSpan(
                    text: " x${cartItem.amountItems}",/*todo: replace with number of items of product*/
                    style: TextStyle(color: kPrimaryColor)
                )
              ])
          )
        ],)
    ],
  );
}