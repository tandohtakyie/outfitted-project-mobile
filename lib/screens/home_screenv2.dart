import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar_v2.dart';
import 'package:outfitted_flutter_mobile/firebase/firebase_config.dart';
import 'package:outfitted_flutter_mobile/screens/search_product_screen.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Horizontal scroll of categories
  // todo: set "see more ->" as last item in list (onclick route to category screen)
  Widget _categoryWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: AppData.categoryList
            .map(
              (category) => ProductIcon(
            model: category,
            onSelected: (model) {
              setState(() {
                AppData.categoryList.forEach((item) {
                  item.isSelected = false;
                });
                model.isSelected = true;
              });
            },
          ),
        )
            .toList(),
      ),
    );
  }

  // Horizontal scroll of products
  Widget _productWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: AppTheme.fullWidth(context) * .7,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 4 / 3,
            mainAxisSpacing: 30,
            crossAxisSpacing: 20),
        padding: EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        children: AppData.productList
            .map(
              (product) => ProductCard(
            product: product,
            onSelected: (model) {
              setState(() {
                AppData.productList.forEach((item) {
                  item.isSelected = false;
                });
                model.isSelected = true;
              });
            },
          ),
        )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    run();
    return Scaffold(
      appBar: OutFittedCustomAppBarV2(
        title: 'OutFitted',
          customIcon: Icon(Icons.search),
        appBar: AppBar(),
        onLeftIconPress: () {
          Route route = MaterialPageRoute(builder: (c) => SearchProductScreen());
          Navigator.push(context, route);
        },
      ),
      backgroundColor: kBackgroundOutFitted,
      body: Center(
        child: Text('This is Home screen!'),
      ),
    );
  }

  run(){
    if(OutFittedApp.sharedPreferences.getStringList(OutFittedApp.customerCartList) == null){
      Fluttertoast.showToast(
        msg: '🚑 🚑',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Color(0xffff0000),
        fontSize: 50,
      );
    }
  }
}
