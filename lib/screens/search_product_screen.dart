import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/productInfo.dart';
import 'package:outfitted_flutter_mobile/firebase/firebase_config.dart';
import 'package:outfitted_flutter_mobile/model/Product.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class SearchProductScreen extends StatefulWidget {
  @override
  _SearchProductScreenState createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {

  Stream<QuerySnapshot> productSearchList;

  void searchProduct(String searchedValue) async {
    productSearchList = FirebaseFirestore.instance.collection(OutFittedApp.collectionProduct)
    // .where('productDescription', isGreaterThanOrEqualTo: searchedValue)
        .where('productDescription', isGreaterThanOrEqualTo: searchedValue)
    // .where('name', isGreaterThanOrEqualTo: searchedValue)
    //.where('supplier', isEqualTo: searchedValue)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value){
            setState(() {
              searchProduct(value);
            });
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search...',
            hintStyle: TextStyle(color: kWhiteColor.withOpacity(0.5)),

          ),
        ),
        backgroundColor: kBackgroundOutFitted,
      ),
      backgroundColor: kBackgroundOutFitted,
      body: StreamBuilder<QuerySnapshot>(
        stream: productSearchList,
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
                    Product product = Product.fromJson(snapshot.data.docs[index].data());
                    // set name of document as id of the product
                    product.id = snapshot.data.docs[index].id;

                    return productInfo(product, context);
                  },
                ),
              );
          }
        },
      ),
    );
  }


}
