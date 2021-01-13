import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar_v2.dart';
import 'package:outfitted_flutter_mobile/components/productInfo.dart';
import 'package:outfitted_flutter_mobile/components/product_collection_card.dart';
import 'package:outfitted_flutter_mobile/firebase/firebase_config.dart';
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

    return Scaffold(
      appBar: OutFittedCustomAppBarV2(
        title: 'Collection',
        customIcon: Icon(Icons.arrow_back),
        appBar: AppBar(),
        onLeftIconPress: (){
          Navigator.pop(context);
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'filterCollection',
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
              stream: categoryName == 'All'
                ? OutFittedApp.firestore
                  .collection(OutFittedApp.collectionProduct)
                  .snapshots()
              : OutFittedApp.firestore
                  .collection(OutFittedApp.collectionProduct)
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
                          Product product = Product.getProductFromJson(snapshot.data.docs[index].data());
                          // set name of document as id of the product
                          product.id = snapshot.data.docs[index].id;

                          return productInfo(product, context);
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


