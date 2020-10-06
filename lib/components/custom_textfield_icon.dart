import 'package:flutter/material.dart';

class CustomTextFieldIcon extends StatelessWidget {
  const CustomTextFieldIcon({
    Key key,
    this.icon,
  }) : super(key: key);
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        20,
        20,
        20,
      ),
      child: icon,
    );
  }
}
