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

  List<QueryDocumentSnapshot> productSearchList = List<QueryDocumentSnapshot>(),
                              newProductSearchList;
  bool isNotSearching = true, noResults = true;

  // todo: dit moet lijst gevonden producten refreshen en updaten -->
  Future<void> updateSearch(String searchedValue) async {
    CollectionReference col1 = FirebaseFirestore.instance.collection(OutFittedApp.collectionProduct);
    /// Method to collect documents by multiple where clauses based on @searchedValue
    final snapshots = col1.snapshots().map(
            (snapshot) => snapshot.docs.where((doc) =>
                doc["category"].toLowerCase().contains(searchedValue) ||
                doc["name"].toLowerCase().contains(searchedValue) ||
                doc["productDescription"].toLowerCase().contains(searchedValue) ||
                doc["supplier"].toLowerCase().contains(searchedValue)
            ));

    newProductSearchList = (await snapshots.first).toList();

    //todo: setState zodat nieuwe lijst in variable komt die lijst weergeeft --> Bij die variable moet gekeken worden of lijst leeg is of niet, als leeg laat tekst zien. als niet leeg laat lijst zien
    setState(() {
      productSearchList = newProductSearchList;
      noResults = productSearchList.isEmpty;
    });
  }

  Widget getContent(){
    if(isNotSearching || productSearchList.isEmpty){
      String contentText;
      // todo: switch with cases
      //  --> case isNotSearching is true ---> set contentText --> "Use searchbox to search {search emoji}"
      //  --> case productSearchList.isEmpty is true ---> set contextText to --> "No results :("

      // todo: return same layout, but only different contentText based on switch-cases
      return null;
    }
    // else return list with results
    return Padding(
      padding: EdgeInsets.only(
        top: 5,
        right: 5,
      ),
      child: GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: productSearchList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.6),
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return productInfo(Product.fromJson(productSearchList[index].data()), context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value){
            // only invoke updateSearch if value is not empty,
            if(value.isNotEmpty){
              updateSearch(value.toLowerCase());
            }
            /* but always invoke setState to update isNotSearching variable
                (so that it stays updated if value is empty or not empty) */
            setState(() {
              isNotSearching = value.isEmpty;
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
      body: getContent(),
    );
  }
}