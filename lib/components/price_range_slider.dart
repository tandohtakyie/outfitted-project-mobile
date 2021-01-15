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



  @override
  Widget build(BuildContext context) {

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
}
