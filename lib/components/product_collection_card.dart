import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:outfitted_flutter_mobile/dialog/error_alert_dialog.dart';
import 'package:outfitted_flutter_mobile/firebase/firebase_config.dart';
import 'package:outfitted_flutter_mobile/model/Product.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class ProductCollectionCard extends StatefulWidget {

  final Product product;
  final Function press;

  const ProductCollectionCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  _ProductCollectionCardState createState() => _ProductCollectionCardState();
}

class _ProductCollectionCardState extends State<ProductCollectionCard> {
  List sharedPrefWishList = OutFittedApp.sharedPreferences
      .getStringList(OutFittedApp.customerWishList);

  bool isFavorite;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    isFavorite = sharedPrefWishList.contains(widget.product.id);

    return GestureDetector(
      onTap: widget.press,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 0.95,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                ),
                child: Image.network(widget.product.productImage),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5,),
              decoration: BoxDecoration(
                  color: kPrimaryColor
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.product.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5, right: 5, bottom: 5,),
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '€${widget.product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                        color: kSecondaryColor
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xFFFFE6E6).withOpacity(0.8),
                        shape: BoxShape.circle
                    ),
                    child: IconButton(
                      icon: new Icon(Icons.favorite,
                          color: (isFavorite)
                              ? Color(0xFFFF4848)
                              : Color(0xff9A9A9A)),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () async {
                        if (OutFittedApp.auth.currentUser != null) {
                          addItemToWish(widget.product.id, context);
                          setState(() {
                            isFavorite = true;
                          });
                        } else {
                          showDialog(
                              context: context,
                              builder: (c) {
                                return ErrorAlertDialog(
                                  message:
                                  'Create an account or Login to add to your cart.',
                                );
                              });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addItemToWish(String productName, BuildContext context) {
    if (sharedPrefWishList.contains(productName)) {
      sharedPrefWishList.remove(productName);

      OutFittedApp.firestore
          .collection(OutFittedApp.collectionCustomer)
          .doc(OutFittedApp.sharedPreferences
          .getString(OutFittedApp.customerUID))
          .update({OutFittedApp.customerWishList: sharedPrefWishList}).then(
              (v) {
            Fluttertoast.showToast(
              msg: widget.product.name + ' removed from wishlist successfully.',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Color(0xfff7b0b7),
              fontSize: 15,
            );

            OutFittedApp.sharedPreferences
                .setStringList(OutFittedApp.customerWishList, sharedPrefWishList);

            setIsFavorite(false);
          });
      return;
    }

    sharedPrefWishList.add(productName);

    OutFittedApp.firestore
        .collection(OutFittedApp.collectionCustomer)
        .doc(OutFittedApp.sharedPreferences.getString(OutFittedApp.customerUID))
        .update({OutFittedApp.customerWishList: sharedPrefWishList}).then((v) {
      Fluttertoast.showToast(
        msg: widget.product.name + ' added to wish successfully 🎉',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Color(0xff5eba7d),
        fontSize: 15,
      );

      OutFittedApp.sharedPreferences
          .setStringList(OutFittedApp.customerWishList, sharedPrefWishList);

      setIsFavorite(true);
    });
  }

  void setIsFavorite(bool pStatus) {
    setState(() {
      isFavorite = pStatus;
    });
  }
}