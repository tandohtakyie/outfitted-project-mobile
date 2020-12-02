import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/Screens/sign_in_screen.dart';
import 'package:outfitted_flutter_mobile/components/categories.dart';
import 'package:outfitted_flutter_mobile/config/drawer_items_config.dart';
import 'package:outfitted_flutter_mobile/firebase/firebase_config.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      padding: EdgeInsets.only(top: 60, bottom: 50, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  OutFittedApp.sharedPreferences.getString(
                    OutFittedApp.customerAvatarUrl,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    OutFittedApp.sharedPreferences
                        .getString(OutFittedApp.customerName),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Welcome to OutFitted",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: drawerItems
                .map((element) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Route route = MaterialPageRoute(builder: (c) => element['route']);
                          Navigator.pushReplacement(context, route);
                        },
                        child: Row(
                          children: [
                            Icon(
                              element['icon'],
                              color: Colors.white.withOpacity(0.7),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              element['title'],
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
          Row(
            children: [
              Icon(
                Icons.settings,
                color: Colors.white.withOpacity(0.7),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Settings',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 2,
                height: 20,
                color: Colors.white.withOpacity(0.7),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                // onTap: () async {
                //
                //  await OutFittedApp.sharedPreferences.remove("uid");
                //   OutFittedApp.sharedPreferences.remove(OutFittedApp.customerEmail);
                //   OutFittedApp.sharedPreferences.remove(OutFittedApp.customerName);
                //   OutFittedApp.sharedPreferences.remove(OutFittedApp.customerAvatarUrl);
                //   OutFittedApp.sharedPreferences.remove(OutFittedApp.customerCartList);
                //
                //   OutFittedApp.auth.signOut().then((c){
                //     Route route = MaterialPageRoute(builder: (c) => SignInScreen());
                //     Navigator.pushReplacement(context, route);
                //   });
                // },
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.white.withOpacity(0.7),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Log out",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
