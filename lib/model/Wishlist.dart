import 'package:flutter/material.dart';
import 'Product.dart';

class WishList{
  Product product;

  WishList({@required this.product});
}

// Dummy data for cart
List<WishList> dummyWishList = [
  WishList(product: dummyProducts[0]),
  WishList(product: dummyProducts[1]),
  WishList(product: dummyProducts[2]),
  WishList(product: dummyProducts[3]),
];