import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/firebase/firebase_config.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class PriceRangeSlider extends StatefulWidget {
  @override
  _PriceRangeSliderState createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {



  static double _lowerValue = 1;
  static double _upperValue = 10;

  RangeValues values = RangeValues(_lowerValue, _upperValue);
  int price = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMaxPrice();
    print('highest price se price price is ==> ' + price.toString());
  }


  @override
  Widget build(BuildContext context) {
    setState(() {
      getMaxPrice();
      print('highest price se gethightest price price is ==> ' + price.toString());
    });

  print(values.start);
  print(values.end);
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        valueIndicatorColor: kSecondaryColor,
        inactiveTrackColor: kPrimaryColor,
      ),
      child: RangeSlider(
        activeColor: kSecondaryColor,
        inactiveColor: kBackgroundOutFitted,
        min: _lowerValue,
        max: _upperValue,
        labels: RangeLabels(values.start.toStringAsFixed(2), values.end.toStringAsFixed(2)),
        divisions: (_upperValue - _lowerValue).toInt() * 2.3.toInt(),
        values: values,
        onChanged: (val){
          setState(() {
            print('values ====> $val');
            values = val;
          });
        },
      ),
    );
  }
  void getMaxPrice() async {
    await OutFittedApp.firestore
        .collection(OutFittedApp.collectionProduct)
        .orderBy('price', descending: true)
        .get()
        .then((value) {
          print('Highest price GOOD ONE ==> ${value.docs[0].data()['price'].toString()}');
          price = int.parse(value.docs[0].data()['price'].toString());
          // print('NEEWWWW $price');
    });
   // https://stackoverflow.com/questions/50296061/flutter-is-it-possible-to-extract-data-from-a-future-without-using-a-futurebui

    // querySnapshot.docs.forEach((snapshot) {
    //   tempPrice = snapshot.data()['price'];
    // });
    // setState(() {
    //   price = tempPrice;
    // });

  }
}
