import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class ShoppingCartItemCard extends StatelessWidget {
  const ShoppingCartItemCard({
    Key key,
    this.image,
    this.productName,
    this.price,
    this.totalOfItems,
  }) : super(key: key);

  final String image, productName, price, totalOfItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Dismissible(
        key: Key('1'),
        direction: DismissDirection.endToStart,
        background: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Color(0xffffe6e6),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Spacer(),
              Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ],
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 88,
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xfff5f6f9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(image),
                  //  child: Image.network(image),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  maxLines: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    text: '€$price',
                    style: TextStyle(color: kSecondaryColor),
                    children: [
                      TextSpan(
                        text: ' x$totalOfItems',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
