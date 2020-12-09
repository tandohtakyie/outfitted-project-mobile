import 'package:flutter/material.dart';

class StoreCategory extends StatelessWidget {
  const StoreCategory({
    Key key,
    this.categoryName,
    this.press,
  }) : super(key: key);
  final String categoryName;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Color(0xff343434).withOpacity(0.95),
                          Color(0xff343434).withOpacity(0.95),
                        ])),
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
                              text: categoryName,
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
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
