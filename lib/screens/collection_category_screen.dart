import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/product_collection_card.dart';
import 'package:outfitted_flutter_mobile/model/Product.dart';
import 'package:outfitted_flutter_mobile/screens/product_details_screen.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class CollectionCategoryScreen extends StatefulWidget {
  @override
  _CollectionCategoryScreenState createState() =>
      _CollectionCategoryScreenState();
}

class _CollectionCategoryScreenState extends State<CollectionCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("products")
          .limit(20)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                itemCount: snapshot.data.docs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (itemWidth/itemHeight),
                    crossAxisCount: 2
                ),
                itemBuilder: (context, index){
                  Product product = Product.fromJson(snapshot.data.docs[index].data());
                  return productInfo(product, context);
                },
              ),
            );
        }
      },
    );
  }
}

Widget productInfo(Product productModel, BuildContext context,
    {Color background, removeCartFunction}) {
  return ProductCollectionCard(
    image: productModel.productImage,
    brand: productModel.supplier,
    model: productModel.name,
    price: productModel.price,
    press: (){
      Route route = MaterialPageRoute(builder: (c) => ProductDetailScreen());
      Navigator.push(context, route);
    },
  );
}
