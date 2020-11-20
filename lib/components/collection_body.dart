import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:outfitted_flutter_mobile/Screens/product_details_screen.dart';
import 'package:outfitted_flutter_mobile/components/card_products_collection.dart';
import 'package:outfitted_flutter_mobile/model/product.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class CollectionBody extends StatefulWidget {
  @override
  _CollectionBodyState createState() => _CollectionBodyState();
}

class _CollectionBodyState extends State<CollectionBody> {
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
