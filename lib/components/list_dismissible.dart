
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/model/Cart.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

import 'list_item_card_shoppingcart.dart';
import 'list_item_card_wishlist.dart';

/*todo: Deze class hernoemen naar 'ListDismissible' --> met als parameter dynamic die lijst met items die getoond moeten worden
            in de deze component wordt gecontroleerd wat voor lijst het is (items voor shoppingcart of voor wishlist)
            Afhankelijk daarvan (van de controle) wordt bepaald of listitem_card_shoppingcart- of listitem_card_wishlist component wordt opgeroepen (zie regel 69)*/

class ListDismissible extends StatefulWidget{

  /*
  * dynamic list = list with certain content which must be visible
  * Function funcOnDismissible = function which must be invoked after item has been dismissed
  * */
  final String emptyListText;
  final dynamic list;
  final Function funcOnDismissible;

  const ListDismissible({
    Key key,
    this.emptyListText = "Empty list",
    @required this.list,
    @required this.funcOnDismissible,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListItemDismissible(emptyListText, list, funcOnDismissible);
}

class _ListItemDismissible extends State<ListDismissible>{

  final String emptyListText;
  final dynamic list;
  final Function funcOnDismissible;

  _ListItemDismissible(this.emptyListText, this.list, this.funcOnDismissible);

  @override
  Widget build(BuildContext context) {
    return list.isEmpty ?
    Center(
      child: Text(
          emptyListText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kWhiteColor,
          )),
    ) :
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Spacer(),
                    Icon(CupertinoIcons.trash),
                  ],
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  // todo: Remove the item from the list (retrieved from function in parameter)
                  // todo: Discuss if is unnecessary to use function via parameter?
                  funcOnDismissible();
                  list.removeAt(index);
                });
                // Show a snackbar. This snackbar could also contain "Undo" actions.
                /*Scaffold
                    .of(context)
                    .showSnackBar(SnackBar(content: Text("Dismiss?")));*/
              },
              child: Row(
                  children:
                  /*todo: vanaf hier checken voor welk component card maken --> listitem_card_shoppingcart of listitem_card_wishlist --> met als parameter een specifieke item binnen van een lijst (bijv. list[0])*/
                  list is List<Cart> ?
                  buildShoppingCartCard(cartItem: list[index])
                      : buildWishListCard(wishListItem: list[index])
              ),
            ),
          )
      ),
    );
  }
}