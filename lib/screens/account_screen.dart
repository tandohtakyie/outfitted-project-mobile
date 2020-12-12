import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOutFittedCustomAppBar(
          title: 'Account',
        customIcon: Icon(Icons.search),
      ),
      backgroundColor: kBackgroundOutFitted,
      body: Center(
        child: Text('This is account screen!'),
      ),
    );
  }
}
