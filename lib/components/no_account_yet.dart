import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/screens/forgot_password_screen.dart';
import 'package:outfitted_flutter_mobile/screens/sign_up_screen.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class NoAccountYet extends StatelessWidget {
  const NoAccountYet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new SignUpScreen()));
          },
          child: Text(
            "Sign Up",
            style: TextStyle(fontSize: 16, color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
