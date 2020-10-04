import 'package:flutter/material.dart';
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

class ProductCollectionCard extends StatelessWidget {
  const ProductCollectionCard({
    Key key,
    this.image,
    this.brand,
    this.model,
    this.price,
    this.press,
  }) : super(key: key);

  final String image, brand, model;
  final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: GestureDetector(
        onTap: press,
        child: Column(
          children: [
            Image.asset(image),
            Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23),
                    )
                  ]),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$brand\n".toUpperCase(),
                          style: Theme.of(context).textTheme.button,
                        ),
                        TextSpan(
                            text: "$model",
                            style: TextStyle(
                              color: kPrimaryColor.withOpacity(0.5),
                            ))
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '€$price',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: kPrimaryColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
