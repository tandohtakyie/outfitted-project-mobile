import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

AppBar buildOutFittedCustomAppBar({String title, String underTitle="", Icon customIcon}) {
  return AppBar(
    elevation: 0.1,
    backgroundColor: kBackgroundOutFitted,
    leading: GestureDetector(
      onTap: () {
        //Navigate to search screen
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: Colors.black26,
            shape: BoxShape.circle,
          ),
          child: customIcon,
        ),
      ),
    ),
    title: underTitle == "" ? Text(
      title,
      style: TextStyle(
        fontFamily: "Muli",
      ),
    ) : Column(
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 7),
        Text(
            underTitle /*todo: replace with length of products list*/,
            style: TextStyle(
                color: Colors.white,
                fontSize: 10
            )
        )
      ],
    ),
    centerTitle: true,
    actions: [
      Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Stack(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.shopping_bag_outlined,
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: kSecondaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(width: 1.5, color: Colors.white)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // replace text with consumer to keep up the counter
                      Text(
                        '999',
                        style: TextStyle(
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
