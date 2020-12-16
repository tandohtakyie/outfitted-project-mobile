import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/list_item_wishlist.dart';
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
        title: 'Wishlist',
        underTitle: "${dummyWishList.length} items" /*todo: replace with amount of items in wishlist list (dummy for now)*/,
        customIcon: Icon(Icons.search),
      ),
      backgroundColor: kWhiteColor,
      body: dummyWishList.isEmpty ?
      Center(
        child: Text(
            'Add a product by pressing the ♡ icon',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
            )),
      ) :
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
            itemCount: dummyWishList.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Dismissible(
                key: Key(dummyWishList[index].product.id.toString()),
                direction: DismissDirection.endToStart,
                background: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFE6E6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      Icon(CupertinoIcons.trash),
                    ],
                  ),
                ),
                onDismissed: (direction){
                  setState(() {
                    // Remove item from list
                    dummyWishList.removeAt(index);
                  });
                },
                child: listItemWishList(wishListItem: dummyWishList[index]),
              ),
            )
        ),
      ),
    );
  }
}
