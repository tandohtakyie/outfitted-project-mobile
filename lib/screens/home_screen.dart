import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:outfitted_flutter_mobile/components/brand_logo.dart';
import 'package:outfitted_flutter_mobile/components/discount_products.dart';
import 'package:outfitted_flutter_mobile/components/productInfo.dart';
import 'package:outfitted_flutter_mobile/components/title_with_button.dart';
import 'package:outfitted_flutter_mobile/firebase/firebase_config.dart';
import 'package:outfitted_flutter_mobile/model/Product.dart';
import 'package:outfitted_flutter_mobile/screens/search_product_screen.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

import 'collection_category_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    run();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      )
    );
    return Scaffold(
      backgroundColor: Color(0xffa19d95),
      //backgroundColor: kWhiteColor,

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: 15
          ),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: Image.asset(
                  'assets/images/dp2.jpg',
                  height: 500,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 100),
                      child: Text('New Collection',
                        style:  TextStyle(
                          fontSize: 45,
                          color: kPrimaryColor,
                          fontFamily: 'BodoniModa',
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/dp3.jpg',
                    height: 340,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 380,
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          child: Image.asset(
                            'assets/images/dp.jpg',
                            width: MediaQuery.of(context).size.width * 0.75,
                            fit: BoxFit.contain,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Route route = MaterialPageRoute(builder: (c) => CollectionCategoryScreen(categoryName : 'All'));
                            Navigator.push(context, route);
                          },
                          child: Row(
                            children: [
                              Text(
                                'See All ',
                                style: TextStyle(
                                  fontSize: 30,
                                    color: kPrimaryColor,
                                  fontFamily: 'BodoniModa',
                                ),
                              ),
                               Icon(Icons.arrow_forward_sharp),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 15
                    ),
                    child: TitleWithButton(
                      title: 'Best Sales',
                      press: (){
                        Route route = MaterialPageRoute(builder: (c) => CollectionCategoryScreen(categoryName : 'Sale'));
                        Navigator.push(context, route);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DiscountProducts(),
                  Padding(
                    padding: EdgeInsets.only(
                        right: 15
                    ),
                    child: TitleWithButton(
                      title: 'Shop by Brand',
                      press: (){
                        Route route = MaterialPageRoute(builder: (c) => CollectionCategoryScreen(categoryName : 'All'));
                        Navigator.push(context, route);

                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                        BrandLogo(
                          brandName: 'Nike',
                          image: 'assets/icons/nike.png',
                        ),
                        BrandLogo(
                          brandName: 'Adidas',
                          image: 'assets/icons/adidas.png',
                        ),
                        BrandLogo(
                          brandName: 'Jordans',
                          image: 'assets/icons/jordans.png',
                        ),
                    ],
                  ),
                  Row(
                    children: [
                      BrandLogo(
                        brandName: 'Emporio',
                        image: 'assets/icons/emporio.png',
                      ),
                      BrandLogo(
                        brandName: 'Puma',
                        image: 'assets/icons/puma.png',
                      ),
                      BrandLogo(
                        brandName: 'Gucci',
                        image: 'assets/icons/gucci.png',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
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
