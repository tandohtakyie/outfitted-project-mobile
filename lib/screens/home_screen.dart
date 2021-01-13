import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar_v2.dart';
import 'package:outfitted_flutter_mobile/firebase/firebase_config.dart';
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
    return Scaffold(
     
      backgroundColor: Color(0xffa19d95),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20),
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
