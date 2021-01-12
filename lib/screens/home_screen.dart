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
  @override
  Widget build(BuildContext context) {
    run();
    return Scaffold(
     
      backgroundColor: Color(0xffa19d95),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 100),
                  child: Text('New Collection',
                    style:  TextStyle(
                      fontSize: 35
                    ),
                  ),
                ),
              ),
              Image.asset(
                'assets/images/dp.jpg',
                height: 350,
              ),
              Text(
                'See All', style: TextStyle(
                fontSize: 30
              ),
              )
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
