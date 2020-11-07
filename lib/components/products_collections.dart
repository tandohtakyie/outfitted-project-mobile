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
            image: "assets/images/tshirt_nike_1.jpg",
            brand: "Vans",
            model: "Skateboard move",
            price: 299,
            press: () {},
          ),
          ProductCollectionCard(
            image: "assets/images/tshirt_london_1.jpg",
            brand: "Vans",
            model: "Skateboard move",
            price: 299,
            press: () {},
          ),
          ProductCollectionCard(
            image: "assets/images/sneaker_vans_1.jpg",
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


