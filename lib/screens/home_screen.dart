import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar_v2.dart';
import 'package:outfitted_flutter_mobile/firebase/firebase_config.dart';
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
      appBar: OutFittedCustomAppBarV2(
        title: 'OutFitted',
          customIcon: Icon(Icons.search),
        appBar: AppBar(),
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
