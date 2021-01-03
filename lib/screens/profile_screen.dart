import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_card.dart';
import 'package:outfitted_flutter_mobile/firebase/firebase_config.dart';
import 'package:outfitted_flutter_mobile/screens/all_orders_screen.dart';
import 'package:outfitted_flutter_mobile/screens/settings_screen.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Profile'),
            SizedBox(
              height: 10,
            ),
            OutFittedCustomCard(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          OutFittedApp.sharedPreferences
                              .getString(OutFittedApp.customerName),
                          style: TextStyle(color: kWhiteColor, fontSize: 30),
                        ),
                        Text(
                          OutFittedApp.sharedPreferences
                              .getString(OutFittedApp.customerEmail),
                          style: TextStyle(color: kWhiteColor),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FloatingActionButton(
                          heroTag: 'btnProfileEdit',
                          onPressed: () {},
                          child: Icon(
                            Icons.edit_outlined,
                          ),
                          backgroundColor: kSecondaryColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text('Address'),
            SizedBox(
              height: 10,
            ),
            OutFittedCustomCard(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Ajax Arena 58',
                          style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Amsterdam, 1585 NT',
                          style: TextStyle(
                            color: kWhiteColor,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.check_box_outlined,
                                  color: kWhiteColor.withOpacity(0.5),
                                ),
                              ),
                              TextSpan(text: 'Delivery address')
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FloatingActionButton(
                          heroTag: 'btnAddressEdit',
                          onPressed: () {},
                          child: Icon(
                            Icons.edit_outlined,
                          ),
                          backgroundColor: kSecondaryColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              height: 2,
              color: kWhiteColor,
            ),
            SizedBox(
              height: 30,
            ),
            Text("Extra's"),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SettingsIcons(
                  text: 'Orders',
                  icon: Icon(
                    Icons.store_outlined,
                    color: kWhiteColor,
                  ),
                  press: () {
                    Route route = MaterialPageRoute(builder: (c) => AllOrdersScreen());
                    Navigator.push(context, route);
                  },
                ),
                SettingsIcons(
                  text: 'Messages',
                  icon: Icon(
                    Icons.mail_outline_outlined,
                    color: kWhiteColor,
                  ),
                  press: () {},
                ),
                SettingsIcons(
                  text: 'Cards',
                  icon: Icon(
                    Icons.credit_card_outlined,
                    color: kWhiteColor,
                  ),
                  press: () {},
                ),
                SettingsIcons(
                  text: 'Settings',
                  icon: Icon(
                    Icons.settings,
                    color: kWhiteColor,
                  ),
                  press: () {
                    Route route = MaterialPageRoute(builder: (c) => SettingsScreen());
                    Navigator.push(context, route);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              height: 2,
              color: kWhiteColor,
            ),
            SizedBox(
              height: 30,
            ),
            Text("Rewards"),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsIcons extends StatelessWidget {
  const SettingsIcons({
    Key key,
    this.icon,
    this.press,
    this.text,
  }) : super(key: key);
  final Icon icon;
  final Function press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: kWhiteColor,
              ),
              shape: BoxShape.circle,
            ),
            child: icon,
          ),
          Text(text),
        ],
      ),
    );
  }
}
