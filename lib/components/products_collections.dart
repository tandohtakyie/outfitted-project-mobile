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
            image: "https://firebasestorage.googleapis.com/v0/b/outfitted-4da25.appspot.com/o/products%2FDri-Fit%20T-shirt.jpg?alt=media&token=4872186d-9da8-44e1-a323-708df33e402b",
            brand: "Vans",
            model: "Skateboard move",
            price: 299,
            press: () {},
          ),
          ProductCollectionCard(
            image: "https://firebasestorage.googleapis.com/v0/b/outfitted-4da25.appspot.com/o/products%2FAutumn%20Jacket.jpg?alt=media&token=fb3abf77-c42b-4829-ba7b-e461637b1463",
            brand: "Vans",
            model: "Skateboard move",
            price: 299,
            press: () {},
          ),
          ProductCollectionCard(
            image: "https://firebasestorage.googleapis.com/v0/b/outfitted-4da25.appspot.com/o/products%2FFilmore%20Decon.jpg?alt=media&token=2bc3d85b-9484-4bec-b6f7-a20d73027b98",
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


