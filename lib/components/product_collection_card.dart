import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class ProductCollectionCard extends StatelessWidget {
  const ProductCollectionCard({
    Key key,
    this.image,
    this.brand,
    this.model,
    this.price,
    this.press,
  }) : super(key: key);

  final String image, brand, model;
  final String price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          AspectRatio(
              aspectRatio: 1.02,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(image),
            ),
          ),
          Text(
              '$model',
            maxLines: 1,
            style: TextStyle(
              fontSize: 14
            ),
          ),
          Row(
            children: [
              Text(
                '€$price',
                style: TextStyle(
                  color: kSecondaryColor
                ),
              ),
            ],
          ),
        ],
      ),
    );
    // return Stack(
    //   children: [
    //     Column(
    //       children: [
    //         Container(
    //           margin: EdgeInsets.only(
    //             left: kDefaultPadding,
    //             top: kDefaultPadding / 2,
    //             bottom: kDefaultPadding * 2.5,
    //           ),
    //           width: size.width * 0.4,
    //           child: GestureDetector(
    //             onTap: press,
    //             child: Column(
    //               children: [
    //                // Image.asset(image),
    //                  Image.network(image),
    //                 Container(
    //                   padding: EdgeInsets.all(kDefaultPadding / 2),
    //                   decoration: BoxDecoration(
    //                       color: kPrimaryColor,
    //                       borderRadius: BorderRadius.only(
    //                         bottomLeft: Radius.circular(10),
    //                         bottomRight: Radius.circular(10),
    //                       ),
    //                       boxShadow: [
    //                         BoxShadow(
    //                           offset: Offset(0, 5),
    //                           blurRadius: 50,
    //                           color: kPrimaryColor.withOpacity(0.23),
    //                         ),
    //                         BoxShadow(
    //                           offset: Offset(5, 0),
    //                           blurRadius: 50,
    //                           color: kPrimaryColor.withOpacity(0.23),
    //                         ),
    //                       ],
    //                   ),
    //                   child: Row(
    //                     children: [
    //                       RichText(
    //                         text: TextSpan(
    //                           children: [
    //                             TextSpan(
    //                               text: "$brand\n".toUpperCase(),
    //                               style: TextStyle(
    //                                 color: kWhiteColor,
    //
    //                               ),
    //                             ),
    //                             TextSpan(
    //                                 text: "$model",
    //                                 style: TextStyle(
    //                                   color: kWhiteColor.withOpacity(0.5),
    //                                   fontSize: 12,
    //                                 ))
    //                           ],
    //                         ),
    //                       ),
    //                       Spacer(),
    //                       Text(
    //                         '€$price',
    //                         style: TextStyle(
    //                           color: kWhiteColor.withOpacity(0.9),
    //                           fontSize: 10,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //     Positioned(
    //       right: 0,
    //       child: Container(
    //         height: 40,
    //         width: 40,
    //         decoration: BoxDecoration(
    //           color: kPrimaryColor,
    //           shape: BoxShape.circle,
    //         ),
    //         child: Icon(
    //           Icons.favorite_border_outlined,
    //           color: Colors.white,
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
