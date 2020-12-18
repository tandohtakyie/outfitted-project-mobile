
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/model/Cart.dart';

import 'list_item_card_shoppingcart2.dart';
import 'list_item_card_wishlist.dart';

/*todo: Deze class hernoemen naar 'ListDismissible' --> met als parameter dynamic die lijst met items die getoond moeten worden
            in de deze component wordt gecontroleerd wat voor lijst het is (items voor shoppingcart of voor wishlist)
            Afhankelijk daarvan (van de controle) wordt bepaald of listitem_card_shoppingcart- of listitem_card_wishlist component wordt opgeroepen (zie regel 69)*/

class ListItemDismissible extends StatefulWidget{

  final dynamic list;
  final int itemIndex;

  const ListItemDismissible({
    Key key,
    @required this.list,
    @required this.itemIndex,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListItemDismissible(list, itemIndex);
}

class _ListItemDismissible extends State<ListItemDismissible>{

  final dynamic list;
  final int itemIndex;

  _ListItemDismissible(this.list, this.itemIndex);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Dismissible(
        key: Key(itemIndex.toString()),
        onDismissed: (direction) {
          setState(() {
            // todo: Remove the item from the list (retrieved from parameter)
            // items.removeAt(index);
          });
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
          children:
          /*todo: vanaf hier checken voor welk component card maken --> listitem_card_shoppingcart of listitem_card_wishlist --> met als parameter een specifieke item binnen van een lijst (bijv. list[0])*/
          list is List<Cart> ?
                buildShoppingCartCard(cartItem: list[itemIndex])
              : buildWishListCard(wishListItem: list[itemIndex])
        ),
      ),
    );
  }
}