import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_card.dart';
import 'package:outfitted_flutter_mobile/firebase/firebase_config.dart';
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
          ],
        ),
      ),
    );
  }
}
