import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/counters/cart_item_counter.dart';
import 'package:outfitted_flutter_mobile/firebase/firebase_config.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';
import 'package:provider/provider.dart';

AppBar buildOutFittedCustomAppBar({String title, Icon customIcon}) {
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
    title: Text(
      title,
      style: TextStyle(
          fontFamily: "Muli",
      ),
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
              OutFittedApp.auth.currentUser != null ?
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
                      Consumer<CartItemCounter>(
                        builder: (context, counter, _){
                          return Text(
                            (OutFittedApp.sharedPreferences.getStringList(OutFittedApp.customerCartList).length - 1).toString(),
                            style: TextStyle(
                              fontSize: 8,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
              :
              SizedBox()
            ],
          ),
        ),
      ),
    ],
  );
}
