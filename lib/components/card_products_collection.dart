import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

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
    return Stack(
      children: [
        Column(
          children: [
            Container(
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
            ),
          ],
        ),
        Positioned(
          right: 0,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.8),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
