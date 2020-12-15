import 'package:flutter/material.dart';
import 'Product.dart';

class Cart{
  Product product;
  int amountItems;

  Cart({@required this.product, @required this.amountItems});
}

// Dummy data for cart
List<Cart> dummyCart = [
  Cart(product: dummyProducts[0], amountItems: 3),
  Cart(product: dummyProducts[1], amountItems: 1),
  Cart(product: dummyProducts[2], amountItems: 7),
  Cart(product: dummyProducts[3], amountItems: 5),
  Cart(product: dummyProducts[1], amountItems: 2),
];