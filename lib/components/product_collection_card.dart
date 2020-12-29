import 'package:flutter/cupertino.dart';
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
  final String price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 0.95,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                ),
                child: Image.network(image),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5,),
              decoration: BoxDecoration(
                  color: kPrimaryColor
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '$model',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5, right: 5, bottom: 5,),
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '€$price',
                    style: TextStyle(
                        color: kSecondaryColor
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6).withOpacity(0.8),
                      shape: BoxShape.circle
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
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
