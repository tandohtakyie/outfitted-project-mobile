import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar.dart';
import 'package:outfitted_flutter_mobile/components/product_collection_card.dart';
import 'package:outfitted_flutter_mobile/model/Product.dart';
import 'package:outfitted_flutter_mobile/screens/product_details_screen.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class CollectionCategoryScreen extends StatelessWidget {
  const CollectionCategoryScreen({
    Key key,
    this.categoryName,
  }) : super(key: key);

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.6;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: buildOutFittedCustomAppBar(
          title: 'Collections',
          customIcon: Icon(Icons.search),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.filter_list_outlined),
        backgroundColor: kSecondaryColor,
      ),
      backgroundColor: kBackgroundOutFitted,
      body: Column(
        children: [
          Text(categoryName),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("products")
                  .where('category', isEqualTo: categoryName)
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError)
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                if (!snapshot.hasData)
                  return Center(
                    child: Text('There are no products yet! Sign up for updates'),
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
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.docs.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.6),
                            crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          print(snapshot.data.docs[index].id);
                          Product product =
                              Product.fromJson(snapshot.data.docs[index].data());
                          return productInfo(product, context, snapshot.data.docs[index].id);
                        },
                      ),
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget productInfo(Product productModel, BuildContext context, String productID,
    {Color background, removeCartFunction}) {
  return ProductCollectionCard(
    image: productModel.productImage,
    brand: productModel.supplier,
    model: productModel.name,
    price: productModel.price.toStringAsFixed(2),
    press: () {
      Route route = MaterialPageRoute(builder: (c) => ProductDetailScreen(product: productModel, productID : productID));
      Navigator.push(context, route);
    },
  );
}
