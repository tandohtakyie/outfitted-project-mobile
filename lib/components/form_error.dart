import 'package:flutter/material.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key key,
    this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            errors.length, (index) => formErrorText(error: errors[index])));
  }

  Row formErrorText({String error}) {
    return Row(
      children: [
        Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 20,
        ),
        SizedBox(
          width: 10,
        ),
        Text(error),
      ],
    );
  }
}
