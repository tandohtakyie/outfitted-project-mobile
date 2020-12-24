
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/model/Cart.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

import 'list_item_card_shoppingcart.dart';
import 'list_item_card_wishlist.dart';

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

  /* todo: @Gibbs is er een betere manier om dit te doen?
      Voor nu declareer ik deze variablen twee keer (in ListDismissible en _ListDismissible)
      Answer --> Gebruik "widget." om de variabelen in parent class (ListDismissible in dit geval) te kunnen gebruiken
   */
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
            padding: EdgeInsets.symmetric(vertical: 7),
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
                  // todo: Remove the item from the list (retrieved from function in parameter) --> need to make sure that every method takes only product as parameter
                  funcOnDismissible(list[index].product);
                  list.removeAt(index);
                });
                // todo: @Gibbs do you think we need this? (snackbar after dismiss)
                // Show a snackbar. This snackbar could also contain "Undo" actions.
                /*Scaffold
                    .of(context)
                    .showSnackBar(SnackBar(content: Text("Dismiss?")));*/
              },
              child: Row(
                  children:
                  /* Check which list-item-card must be created:
                      items for shopping cart or items for wishlist */
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
