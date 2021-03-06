import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';
import 'package:provider/provider.dart';

class IconButtonWithCounter extends StatelessWidget {
  const IconButtonWithCounter({
    Key key,
    @required this.icon,
    this.numOfItems,
    @required this.press,
    this.consumer,
  }) : super(key: key);

  final Icon icon;
  final int numOfItems;
  final GestureTapCallback press;
  final Consumer consumer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(
        50,
      ),
      child: Stack(
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.8),
              shape: BoxShape.circle,
            ),
            child: icon,
          ),
          // if(numOfItems != 0)
            Positioned(
              right: 0,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1.5,
                    color: Colors.white,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    consumer,
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
