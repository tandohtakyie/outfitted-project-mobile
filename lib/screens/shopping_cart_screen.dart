import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/list_item.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar.dart';
import 'package:outfitted_flutter_mobile/model/Cart.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {

  int total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOutFittedCustomAppBar(
        title: 'Shopping cart',
        underTitle: "${dummyCart.length} items" /*todo: replace with amount of items in shopping cart list (dummy for now)*/,
        customIcon: Icon(Icons.search),
      ),
      backgroundColor: Colors.white,
      /*todo: make component of below ListView (including padding and dismissible)?*/
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
            itemCount: dummyCart.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Dismissible(
                key: Key(dummyCart[index].product.id.toString()),
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
                onDismissed: (direction){
                  setState(() {
                    dummyCart.removeAt(index);
                  });
                },
                child: ListItem(cartItem: dummyCart[index]),
              ),
            )
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        // height: 175,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -15), 
                blurRadius: 20,
                color: Color(0xFFDADADA).withOpacity(0.15),
              ),
            ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.receipt, color: Colors.orange,),
                  ),
                  Spacer(),
                  Text(
                    "Add voucher code",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Icon(Icons.arrow_forward_ios, size: 12, color: Colors.black),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                      TextSpan(
                        text: "Total:\n",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: "\€$total", /*todo: use real sum*/
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.indigo
                            )
                          ),
                        ],
                      ),
                  ),
                  SizedBox(
                    width: 190,
                    child: TextButton(
                        child: Text("Check out"),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.indigo,
                          onSurface: Colors.grey,
                        ),
                        onPressed: () {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text("Purchase..."),
                          ));
                        }
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
