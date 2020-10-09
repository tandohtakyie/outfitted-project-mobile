import 'package:flutter/material.dart';

class ForgotPasswordBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text("Forgot Password",
          style: TextStyle(
            fontSize: 28,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: "Muli"
          ),
          ),
          Text("Please enter your email and we will send \nyou a link to return to your account",
          textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
