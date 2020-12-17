import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

/*todo: @Gibbs We hebben hier ook deze method nodig: onDismissed --> dit is voor wat er moet gebeuren als item wordt verwijderd
          We hebben hier dus ook de hele list nodig waarin item zit om item te kunnen verwijderen.
          Ik denk daarom dat beter is als we een component maken die*/

/*todo: Deze class hernoemen naar 'ListDismissible' --> met als parameter String die zegt wat voor lijst het is ('cart' of 'wish') EN dynamic die lijst met items die getoond moeten worden
            in de list_dismissible component wordt gecontroleerd wat voor lijst het is (items voor shoppingcart of voor wishlist)
            Afhankelijk daarvan (van de controle) wordt bepaald of listitem_card_shoppingcart- of listitem_card_wishlist component wordt opgeroepen (zie regel 46)*/

class ShoppingCartItemCard extends StatelessWidget {
  const ShoppingCartItemCard({
    Key key,
    this.image,
    this.productName,
    this.price,
    this.totalOfItems,
  }) : super(key: key);

  final String image, productName, price, totalOfItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Dismissible(
        key: Key('1'),
        onDismissed: (direction) {
          // Remove the item from the data source.
          // todo: FIX setState()! Check this: https://stackoverflow.com/questions/49597189/the-method-setstate-isnt-defined-for-the-class-myapp-error-in-flutter/49618021
          // setState(() {
          //   items.removeAt(index);
          // });

          // Show a snackbar. This snackbar could also contain "Undo" actions.
          Scaffold
              .of(context)
              .showSnackBar(SnackBar(content: Text("Dismiss?")));
        },
        direction: DismissDirection.endToStart,
        background: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Color(0xffffe6e6),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Spacer(),
              Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ],
          ),
        ),
        child: Row(
          children: [
            /*todo: vanaf hier moet er een loop komen waarin steeds component voor shopping cart items of wishlist items wordt aangeroepen*/
            /*todo: vanaf hier twee components maken --> listitem_card_shoppingcart en listitem_card_wishlist --> met als parameter een specifieke item binnen van een lijst (bijv. list[0])*/
            SizedBox(
              width: 88,
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xfff5f6f9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(image),
                  //  child: Image.network(image),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  maxLines: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    text: '€$price',
                    style: TextStyle(color: kSecondaryColor),
                    children: [
                      TextSpan(
                        text: ' x$totalOfItems',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            /*todo: HIER EINDE van de twee components --> listitem_card_shoppingcart en listitem_card_wishlist*/
          ],
        ),
      ),
    );
  }
}
