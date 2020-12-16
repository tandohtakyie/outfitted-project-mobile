import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar.dart';
import 'package:outfitted_flutter_mobile/components/shopping_cart_item_card.dart';
import 'package:outfitted_flutter_mobile/counters/cart_item_counter.dart';
import 'package:outfitted_flutter_mobile/counters/total_amount.dart';
import 'package:outfitted_flutter_mobile/firebase/firebase_config.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';
import 'package:provider/provider.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  double totalAmount;

  @override
  void initState() {
    super.initState();

    totalAmount = 0;
    Provider.of<TotalAmount>(context, listen: false).displayResult(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOutFittedCustomAppBar(
        title: 'Shopping',
        underTitle: OutFittedApp.auth.currentUser != null
        ? (OutFittedApp.sharedPreferences
            .getStringList(OutFittedApp.customerCartList)
            .length -
            1)
            .toString() +
            " items"
        :'',
        customIcon: Icon(Icons.search),
      ),
      backgroundColor: kBackgroundOutFitted,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ShoppingCartItemCard(
              price: '300',
              image: 'assets/images/sneaker_nike_2.jpg',
              productName: 'Nike Air Max Runner',
              totalOfItems: '3',
            ),
            ShoppingCartItemCard(
              price: '300',
              image: 'assets/images/sneaker_nike_2.jpg',
              productName: 'Nike Air Max Runner',
              totalOfItems: '3',
            ),
            ShoppingCartItemCard(
              price: '300',
              image: 'assets/images/sneaker_nike_2.jpg',
              productName: 'Nike Air Max Runner',
              totalOfItems: '3',
            ),
            ShoppingCartItemCard(
              price: '300',
              image: 'assets/images/sneaker_nike_2.jpg',
              productName: 'Nike Air Max Runner',
              totalOfItems: '3',
            ),
            ShoppingCartItemCard(
              price: '300',
              image: 'assets/images/sneaker_nike_2.jpg',
              productName: 'Nike Air Max Runner',
              totalOfItems: '3',
            ),
            ShoppingCartItemCard(
              price: '300',
              image: 'assets/images/sneaker_nike_2.jpg',
              productName: 'Nike Air Max Runner',
              totalOfItems: '3',
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        // height: 175,
        decoration: BoxDecoration(
          color: kPrimaryColor,
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
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutFittedApp.auth.currentUser != null
                  ? Consumer2<TotalAmount, CartItemCounter>(
                      builder: (context, amountProvider, cartProvider, c){
                        return Text.rich(
                          TextSpan(
                            text: "Total:\n",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                            ),
                            children: [
                              TextSpan(
                                text: cartProvider.count == 0
                                    ? "\€0.00"
                                    : "\€${amountProvider.totalAmount.toStringAsFixed(2)}" /*todo: use real sum*/,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: kSecondaryColor,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                  )
                  : Text.rich(
                      TextSpan(
                      text: "Total:\n",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                        ),
                        children: [
                          TextSpan(
                            text:  "\€0.00"/*todo: use real sum*/,
                            style: TextStyle(
                              fontSize: 16,
                              color: kSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(
                    width: 190,
                    child: TextButton(
                        child: Text("Check out"), // hide check out button when not logged in
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: kSecondaryColor,
                          onSurface: Colors.grey,
                        ),
                        onPressed: () {
                          if(OutFittedApp.sharedPreferences.getStringList(OutFittedApp.customerCartList).length == 1){
                            Fluttertoast.showToast(
                              msg: 'Your cart is empty.',
                              backgroundColor: Color(0xffffe6e6),
                            );
                          }else{
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("Purchase..."),
                            ));

                            // Navigate customer to fill in address screen.
                          }
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


