import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:outfitted_flutter_mobile/counters/cart_item_counter.dart';
import 'package:outfitted_flutter_mobile/firebase/firebase_config.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {

  final String addressID;
  final double totalAmount;

  const PaymentScreen({Key key, this.addressID, this.totalAmount,}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  saveOrderDetails() {

    saveOrderDetailsForCustomer({
      OutFittedApp.addressID: widget.addressID,
      OutFittedApp.totalAmount : widget.totalAmount,
      "orderBy" : OutFittedApp.sharedPreferences.getString(OutFittedApp.customerUID),
      OutFittedApp.productID : OutFittedApp.sharedPreferences.getStringList(OutFittedApp.customerCartList),
      OutFittedApp.paymentDetails : "PayPal on Delivery",
      OutFittedApp.orderTime : DateTime.now().microsecondsSinceEpoch.toString(),
      OutFittedApp.isSuccess : true,
    });

    saveOrderDetailsForAdmin({
      OutFittedApp.addressID: widget.addressID,
      OutFittedApp.totalAmount : widget.totalAmount,
      "orderBy" : OutFittedApp.sharedPreferences.getString(OutFittedApp.customerUID),
      OutFittedApp.productID : OutFittedApp.sharedPreferences.getStringList(OutFittedApp.customerCartList),
      OutFittedApp.paymentDetails : "PayPal on Delivery",
      OutFittedApp.orderTime : DateTime.now().microsecondsSinceEpoch.toString(),
      OutFittedApp.isSuccess : true,
    }).whenComplete(() => {
      emptyCart()
    });
  }

  emptyCart(){
    OutFittedApp.sharedPreferences.setStringList(OutFittedApp.customerCartList, ['garbageValue']);
    List tempList = OutFittedApp.sharedPreferences.getStringList(OutFittedApp.customerCartList);

    OutFittedApp.firestore
    .collection(OutFittedApp.collectionCustomer)
    .doc(OutFittedApp.sharedPreferences.getString(OutFittedApp.customerUID))
    .update({
      OutFittedApp.customerCartList : tempList,
    }).then((value) {
      OutFittedApp.sharedPreferences.setStringList(OutFittedApp.customerCartList, tempList);
      Provider.of<CartItemCounter>(context, listen: false).displayResult();
    });

    Fluttertoast.showToast(msg: 'order placed successfully!');

  }

  Future saveOrderDetailsForCustomer(Map<String, dynamic> data) async {
    await OutFittedApp.firestore
        .collection(OutFittedApp.collectionCustomer)
        .doc(OutFittedApp.sharedPreferences.getString(OutFittedApp.customerUID))
        .collection(OutFittedApp.collectionOrders)
        .doc(OutFittedApp.sharedPreferences.getString(OutFittedApp.customerUID) + data['orderTime']) // to make each order unique
        .set(data);
  }

  Future saveOrderDetailsForAdmin(Map<String, dynamic> data) async {
    await OutFittedApp.firestore
        .collection(OutFittedApp.collectionOrders)
        .doc(OutFittedApp.sharedPreferences.getString(OutFittedApp.customerUID) + data['orderTime']) // to make each order unique
        .set(data);
  }

}
