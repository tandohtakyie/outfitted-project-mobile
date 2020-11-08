import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/model/product.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  ProductDetailScreen({this.product});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantityOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: RoundedIconButton(
          iconData: Icons.arrow_back_ios,
          press: () => Navigator.pop(context),
        ),
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    Key key,
    @required this.iconData,
    @required this.press
  }) : super(key: key);

  final IconData iconData;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: FlatButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
        child: Icon(iconData, color: Colors.white,),
        onPressed: press,
      ),
    );
  }
}
