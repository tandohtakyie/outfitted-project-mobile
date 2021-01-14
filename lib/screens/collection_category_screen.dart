import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar_v2.dart';
import 'package:outfitted_flutter_mobile/components/price_range_slider.dart';
import 'package:outfitted_flutter_mobile/components/productInfo.dart';
import 'package:outfitted_flutter_mobile/components/product_collection_card.dart';
import 'package:outfitted_flutter_mobile/firebase/firebase_config.dart';
import 'package:outfitted_flutter_mobile/model/Product.dart';
import 'package:outfitted_flutter_mobile/screens/product_details_screen.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class CollectionCategoryScreen extends StatefulWidget {
  const CollectionCategoryScreen({
    Key key,
    this.categoryName,
    this.brandName,
  }) : super(key: key);

  final String categoryName, brandName;

  @override
  _CollectionCategoryScreenState createState() =>
      _CollectionCategoryScreenState();
}

class _CollectionCategoryScreenState extends State<CollectionCategoryScreen> {
  int selectedSortByRadio = 0;

  void setSelectedRadioValue(int val) {
    setState(() {
      selectedSortByRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OutFittedCustomAppBarV2(
        title: 'Collection',
        customIcon: Icon(Icons.arrow_back),
        appBar: AppBar(),
        onLeftIconPress: () {
          Navigator.pop(context);
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'filterCollection',
        onPressed: () {
          showFilterModalBottomSheet(context);
        },
        child: Icon(Icons.filter_list_outlined),
        backgroundColor: kSecondaryColor,
      ),
      backgroundColor: kBackgroundOutFitted,
      body: Column(
        children: [
          Text(widget.categoryName),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: widget.categoryName == 'All'
                  ? OutFittedApp.firestore
                      .collection(OutFittedApp.collectionProduct)
                      .snapshots()
                  : widget.categoryName == widget.brandName
                      ? OutFittedApp.firestore
                          .collection(OutFittedApp.collectionProduct)
                          .where('supplier', isEqualTo: widget.brandName)
                          .snapshots()
                      : widget.categoryName == 'Sale'
                          ? OutFittedApp.firestore
                              .collection(OutFittedApp.collectionProduct)
                              .where('discount', isGreaterThan: 0)
                              .snapshots()
                          : OutFittedApp.firestore
                              .collection(OutFittedApp.collectionProduct)
                              .where('category', isEqualTo: widget.categoryName)
                              .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError)
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                if (!snapshot.hasData)
                  return Center(
                    child:
                        Text('There are no products yet! Sign up for updates'),
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
                          childAspectRatio: 0.7,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          Product product = Product.getProductFromJson(
                              snapshot.data.docs[index].data());
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

  void showFilterModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext buildContext) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter state) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 400,
                decoration: BoxDecoration(color: kPrimaryColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'Filter',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Text('Sort By'),
                    Column(
                      children: [
                        SizedBox(
                          height: 35,
                          child: RadioListTile(
                            activeColor: kSecondaryColor,
                              value: 0,
                              groupValue: selectedSortByRadio,
                              title: Text('Sale'),
                              onChanged: (val) {
                                state(() {
                                  selectedSortByRadio = val;
                                });
                              },
                          ),
                        ),
                        SizedBox(
                          height: 35,
                          child: RadioListTile(
                            activeColor: kSecondaryColor,
                              value: 1,
                              groupValue: selectedSortByRadio,
                              title: Text('Newest'),
                              onChanged: (val) {
                                state(() {
                                  selectedSortByRadio = val;
                                });
                              }),
                        ),
                        SizedBox(
                          height: 35,
                          child: RadioListTile(
                              activeColor: kSecondaryColor,
                              value: 2,
                              groupValue: selectedSortByRadio,
                              title: Text('Price High-Low'),
                              onChanged: (val) {
                                state(() {
                                  selectedSortByRadio = val;
                                });
                              }),
                        ),
                        SizedBox(
                          height: 35,
                          child: RadioListTile(
                              activeColor: kSecondaryColor,
                              value: 3,
                              groupValue: selectedSortByRadio,
                              title: Text('Price Low-High'),
                              onChanged: (val) {
                                state(() {
                                  selectedSortByRadio = val;
                                });
                              }),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      thickness: 1,
                      color: kWhiteColor.withOpacity(0.3),
                    ),
                    Text('Price Range'),
                    PriceRangeSlider(),
                    Divider(
                      thickness: 1,
                      color: kWhiteColor.withOpacity(0.3),
                    ),
                    Text('Brand'),
                  ],
                ),
              );
            },
          );
        });
  }
}
