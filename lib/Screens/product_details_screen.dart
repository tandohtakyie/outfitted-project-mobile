import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/drawer_collections_animation.dart';
import 'package:outfitted_flutter_mobile/model/product.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  ProductDetailScreen({this.product});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantityOfItems = 1;
  Route route = MaterialPageRoute(builder: (c) => DrawerCollectionsAnimation());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: RoundedIconButton(
          iconData: Icons.arrow_back_ios,
          press: () => Navigator.pushReplacement(context, route),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              //   width: 238,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(widget.product.productImage),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  height: 68,
                  width: 58,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: kPrimaryColor),
                  ),
                  child: Image.network(widget.product.productImage),
                ),
              ],
            ),
            TopRoundedContainer(
              color: Colors.white,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.supplier +
                                  " " +
                                  widget.product.name,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text("€ 250"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          width: 64,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFE6E6),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: Color(0xFFFF4848),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 64,
                        ),
                        child: Text(widget.product.productDescription),
                      ),
                    ],
                  ),
                  TopRoundedContainer(
                    color: Color(0xFFF6F7F9),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                       // horizontal: 20,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Text(
                                  "Select color",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                ColorDot(
                                  color: Colors.red,
                                ),
                                ColorDot(
                                  color: Colors.purple,
                                ),
                                ColorDot(
                                  color: Colors.brown,
                                ),
                                ColorDot(
                                  color: Colors.green,
                                ),
                                ColorDot(
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          TopRoundedContainer(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 55,
                                color: kPrimaryColor,
                                onPressed: (){},
                                child: Text(
                                  "Add to Cart",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key key,
    this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(8),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        // color: Colors.red,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.transparent),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class TopRoundedContainer extends StatelessWidget {
  const TopRoundedContainer({
    Key key,
    this.color,
    this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 20),
      width: double.infinity,
      //height: 300,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: child,
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton(
      {Key key, @required this.iconData, @required this.press})
      : super(key: key);

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
        child: Icon(
          iconData,
          color: Colors.white,
        ),
        onPressed: press,
      ),
    );
  }
}
