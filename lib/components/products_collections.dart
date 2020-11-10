import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/card_products_collection.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class ProductsCollections extends StatelessWidget {
  const ProductsCollections({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ProductCollectionCard(
            image: "https://firebasestorage.googleapis.com/v0/b/outfitted-4da25.appspot.com/o/products%2FAir%20Max%20570.jpg?alt=media&token=d5710124-7ac6-42c9-8d74-339b6adce583",
            brand: "Vans",
            model: "Skateboard move",
            price: 299,
            press: () {},
          ),
          ProductCollectionCard(
            image: "https://firebasestorage.googleapis.com/v0/b/outfitted-4da25.appspot.com/o/products%2FDri-Fit.jpg?alt=media&token=b0c6eafd-1c60-44b0-bd49-c191ee0fa084",
            brand: "Vans",
            model: "Skateboard move",
            price: 299,
            press: () {},
          ),
          ProductCollectionCard(
            image: "https://firebasestorage.googleapis.com/v0/b/outfitted-4da25.appspot.com/o/products%2FAir%20Max%20570.jpg?alt=media&token=d5710124-7ac6-42c9-8d74-339b6adce583",
            brand: "Vans",
            model: "Skateboard move",
            price: 299,
            press: () {},
          ),
        ],
      ),
    );
  }
}


