import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/list_dismissible.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar.dart';
import 'package:outfitted_flutter_mobile/model/Wishlist.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class WishlistScreen extends StatefulWidget {
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOutFittedCustomAppBar(
          title: 'WishList',
          customIcon: Icon(Icons.search),
      ),
      backgroundColor: kBackgroundOutFitted,
      body: ListDismissible(
            emptyListText:"Add a product by pressing the ❤ icon",
            list: dummyWishList,
            funcOnDismissible: onDismissed),
    );
  }

  // todo: @Gibbs do you think we need this?
  void onDismissed(){
    print("JAA REMOVED WISH ITEM!");
  }
}
