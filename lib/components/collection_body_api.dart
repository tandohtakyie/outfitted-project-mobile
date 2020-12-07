import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/screens/product_details_screen.dart';
import 'package:outfitted_flutter_mobile/api/ProductApiResponse.dart';
import 'package:outfitted_flutter_mobile/model/product.dart';
import 'package:http/http.dart' as http;

import 'card_products_collection.dart';

class CollectionBodyAPI extends StatefulWidget {
  @override
  _CollectionBodyAPIState createState() => _CollectionBodyAPIState();
}

class _CollectionBodyAPIState extends State<CollectionBodyAPI> {

  Future<List<Product>> fetchProducts() async {
    final response = await http.get('http://192.168.192.19:5000/allProducts');
    if (response.statusCode == 200) {
      final List parsed = json.decode(response.body);
      List<Product> responseProduct = new ProductApiResponse.fromJsonApi(parsed).products;
      return responseProduct;
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return FutureBuilder<List<Product>>(
      future: fetchProducts(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot){
          if (snapshot.hasError)
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: Text('Loading'),
              );
            default:
              return Padding(
                padding: EdgeInsets.only(
                  top: 5,
                  right: 5,
                ),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: (itemWidth/itemHeight),
                      crossAxisCount: 2
                  ),
                  itemBuilder: (context, index){

                    Product product = Product.fromJsonApi(snapshot.data[index].toJsonApi());
                    return sourceInfo(product, context);
                  },
                ),
              );
          }
        },
    );
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

