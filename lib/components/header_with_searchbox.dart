import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/Screens/cart_screen.dart';
import 'package:outfitted_flutter_mobile/components/icon_button_with_counter.dart';
import 'package:outfitted_flutter_mobile/components/searchbar.dart';
import 'package:outfitted_flutter_mobile/components/size_config.dart';
import 'package:outfitted_flutter_mobile/counters/cart_item_counter.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';
import 'package:provider/provider.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 1.5),
      // cover 20% of total height
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 35 + kDefaultPadding,
            ),
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36)),
            ),
            child: Row(
              children: [
                Text(
                  "Welcome Buddy!",
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                      "assets/images/logo_outfitted_white_bg_transparent.png"),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Searchbar(),//searchbar
                IconButtonWithCounter(
                  press: () {
                    Route route =
                        MaterialPageRoute(builder: (c) => CartScreen());
                    Navigator.pushReplacement(context, route);
                  },
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                  ),
                  numOfItems: 1,
                  consumer: Consumer<CartItemCounter>(
                    builder: (context, counter, _) {
                      return Text(
                        counter.count.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 8,
                            height: 1,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


