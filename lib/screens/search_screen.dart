import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar.dart';
import 'package:outfitted_flutter_mobile/components/store_category.dart';
import 'package:outfitted_flutter_mobile/firebase/firebase_config.dart';
import 'package:outfitted_flutter_mobile/model/Category.dart';
import 'package:outfitted_flutter_mobile/screens/collection_category_screen.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: buildOutFittedCustomAppBar(
          title: 'Search Category',
        customIcon: Icon(Icons.search),
      ),
      resizeToAvoidBottomPadding: false,
      backgroundColor: kBackgroundOutFitted,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(OutFittedApp.collectionProduct)
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
                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index){
                       Category category = Category.fromJson(snapshot.data.docs[index].data());
                        return categoryInfo(category, context);
                    }
                );
            }
          },
        ),
      ),
    );
  }
}

Widget categoryInfo(Category category, BuildContext context) {
  return StoreCategory(
    categoryName: category.categoryName,
    press: (){
      Route route = MaterialPageRoute(builder: (c) => CollectionCategoryScreen(categoryName : category.categoryName));
      Navigator.push(context, route);
    },
  );
}
