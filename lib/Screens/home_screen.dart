import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/categories.dart';
import 'package:outfitted_flutter_mobile/components/header_with_searchbox.dart';
import 'package:outfitted_flutter_mobile/components/products_collections.dart';
import 'package:outfitted_flutter_mobile/components/title_with_more_button.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;

  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 350),
      child: Scaffold(
        appBar: buildAppBar(),
        body: HomeBody(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: isDrawerOpen
          ? IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          setState(() {
            xOffset = 0;
            yOffset = 0;
            scaleFactor = 1;
            isDrawerOpen = false;
          });
        },
      )
          : IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white70,
        ),
        onPressed: () {
          setState(() {
            xOffset = 230;
            yOffset = 150;
            scaleFactor = 0.6;
            isDrawerOpen = true;
          });
        },
      ),
    );
  }
}

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

class StoreCategories extends StatelessWidget {
  const StoreCategories({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: shadowList,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    categories[index]['iconPath'],
                    height: 50,
                    width: 50,
                    color: Colors.grey[700],
                  ),
                ),
                Container(
                  child: Text(
                    categories[index]['name'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      color: kPrimaryColor,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
