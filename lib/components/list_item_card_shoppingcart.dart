import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/model/Cart.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

List<Widget> buildShoppingCartCard({@required Cart cartItem,}) {

  final String image = cartItem.product.productImage,
               productName = cartItem.product.name,
               price = cartItem.product.price.toStringAsFixed(2),
               totalOfItems = cartItem.amountItems.toString();

  return [
    SizedBox(
      width: 92,
      child: AspectRatio(
        aspectRatio: 0.92,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xfff5f6f9),
            borderRadius: BorderRadius.circular(15),
          ),
           child: Image.network(image),
          // child: Image.asset(image),
        ),
      ),
    ),
    SizedBox(
      width: 20,
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 200,
          child: Text(
            '$productName',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
            ),
            maxLines: 2,
          ),
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
                  fontSize: 15
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(4)
              ),
              child: Icon(
                Icons.remove,
                color: kWhiteColor,
                size: 20,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                '$totalOfItems',
              ),
            ),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(4)
              ),
              child: Icon(
                Icons.add,
                color: kWhiteColor,
                size: 20,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ),
  ];
}
