import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/size_config.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Your Cart",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "[sum of items]" /*todo: replace with length of products list*/,
              style: TextStyle(
                  color: Colors.white,
                fontSize: 10
              )
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 88,
                child: AspectRatio(
                  aspectRatio: 0.88,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset("assets/images/sneaker_nike_2.jpg"), /*todo: replace with image of product*/
                  ),
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                    "Name of product",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    maxLines: 2,
                ),
                const SizedBox(height: 10),
                Text.rich(TextSpan(
                  text: "\€0.00", /*todo: replace with price of product*/
                  style: TextStyle(color: Colors.indigo),
                  children: [
                    TextSpan(
                      text: " x2",/*todo: replace with number of items of product*/
                      style: TextStyle(color: kPrimaryColor)
                    )
                  ])
                )
              ],)
            ],
          ),
        ],
      ),
    );
  }
}
