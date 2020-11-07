import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/header_with_searchbox.dart';
import 'package:outfitted_flutter_mobile/components/products_collections.dart';
import 'package:outfitted_flutter_mobile/components/store_categories.dart';
import 'package:outfitted_flutter_mobile/components/title_with_more_button.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // enable scrolling on small devices
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          StoreCategories(),
          TitleWithMoreButton(
            title: "New Collection",
            press: () {},
          ),
          ProductsCollections(),
        ],
      ),
    );
  }
}
