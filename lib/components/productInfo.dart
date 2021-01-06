import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/product_collection_card.dart';
import 'package:outfitted_flutter_mobile/model/Product.dart';
import 'package:outfitted_flutter_mobile/screens/product_details_screen.dart';

Widget productInfo(Product productModel, BuildContext context,) {
  print("BEFOREE ROUTTEE ${productModel.name}");
  return ProductCollectionCard(
    product: productModel,
    press: () {
      print("ROUTTEE ${productModel.name}");
      Route route = MaterialPageRoute(builder: (c) => ProductDetailScreen(product: productModel));
      Navigator.push(context, route);
    },
  );
}
