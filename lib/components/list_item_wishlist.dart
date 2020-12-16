
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/model/Cart.dart';
import 'package:outfitted_flutter_mobile/model/Wishlist.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

Row listItemWishList({WishList wishListItem,}) {
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
            child: Image.asset(wishListItem.product.productImage),
          ),
        ),
      ),
      SizedBox(width: 20),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            wishListItem.product.name,
            style: TextStyle(fontSize: 16, color: Colors.black),
            maxLines: 2,
          ),
          const SizedBox(height: 10),
          Text.rich(TextSpan(
            text: "\€${wishListItem.product.price.toStringAsFixed(2)}",
            style: TextStyle(color: Colors.indigo),
          ))
        ],
      )
    ],
  );
}