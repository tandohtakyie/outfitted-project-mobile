import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
    return CustomScrollView(
      slivers: [
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("products")
              .limit(20)
              .snapshots(),
          builder: (context, dataSnapshot) {
            return !dataSnapshot.hasData
                ? SliverToBoxAdapter(
              child: Text("No data"),
            )
                : SliverStaggeredGrid.countBuilder(
              crossAxisCount: 1,
              staggeredTileBuilder: (c) => StaggeredTile.fit(1),
              itemBuilder: (context, index) {
                Product product = Product.fromJson(
                    dataSnapshot.data.docs[index].data());
                return sourceInfo(product, context);
              },
              itemCount: dataSnapshot.data.docs.length,
            );
          },
        ),
      ],
    );
  }
}

Widget sourceInfo(Product product, BuildContext context,
    {Color background, removeCartFunction}) {
  // return Container(
  //   child: Center(
  //     child: Text(product.name),
  //   ),
  // );
  return ProductCollectionCard(
    image: product.productImage,
    brand: product.supplier,
    model: product.name,
    price: 250,
  );
}

Widget card({Color primaryColor = kPrimaryColor, String imgPath}) {
  return Container();
}
