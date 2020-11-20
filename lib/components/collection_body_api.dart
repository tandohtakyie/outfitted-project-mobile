import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/Screens/product_details_screen.dart';
import 'package:outfitted_flutter_mobile/model/product.dart';
import 'package:http/http.dart' as http;

import 'card_products_collection.dart';

class CollectionBodyAPI extends StatefulWidget {
  @override
  _CollectionBodyAPIState createState() => _CollectionBodyAPIState();
}

class _CollectionBodyAPIState extends State<CollectionBodyAPI> {
  Future<Product> futureProducts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureProducts = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return FutureBuilder<Product>(
      future: futureProducts,
      builder: (context, snapshot){
        if(snapshot.hasData){
          return Padding(
            padding: EdgeInsets.only(
              top: 5,
              right: 5,
            ),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data.toJson().length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: (itemWidth/itemHeight),
                  crossAxisCount: 2
              ),
              itemBuilder: (context, index){
                Product product = Product.fromJson(snapshot.data.toJson()[index].data());
                return sourceInfo(product, context);
              },
            ),
          );
        } else if(snapshot.hasError){
          return Text('${snapshot.error}');
        }
        return Center(
          child: Text('Loading data!'),
        );
      },
    );
  }
}

Future<Product> fetchProducts() async {
  //final response = await http.get('http://127.0.0.1:5000/allProducts');
  final response = await http.get('http://192.168.192.19:5000/allProducts');
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return Product.fromJson(jsonData);
  } else {
    throw Exception('Failed to load products');
  }
}

Widget sourceInfo(Product productModel, BuildContext context,
    {Color background, removeCartFunction}) {
  return ProductCollectionCard(
    image: productModel.productImage,
    brand: productModel.supplier,
    model: productModel.name,
    price: productModel.price,
    press: (){
      Route route = MaterialPageRoute(builder: (c) => ProductDetailScreen(product : productModel));
      Navigator.pushReplacement(context, route);
    },
  );
}
