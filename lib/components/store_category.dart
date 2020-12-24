import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/model/CollectionCategory.dart';

class StoreCategory extends StatelessWidget {
  const StoreCategory({
    Key key,
    this.collectionCategory,
    this.press,
  }) : super(key: key);
  final CollectionCategory collectionCategory;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 280,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Flex(
                    direction: Axis.vertical,
                    children: [
                      Image.asset(collectionCategory.categoryImage)
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Color(0xff343434).withOpacity(0.20),
                          Color(0xff343434).withOpacity(0.20),
                        ],
                        ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Center(
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(color: Colors.white),
                          children: [
                            TextSpan(
                              text: collectionCategory.categoryName,
                              style: TextStyle(
                                  fontSize: 28,
                                  fontFamily: "Muli",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
