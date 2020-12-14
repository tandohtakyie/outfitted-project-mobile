import 'package:flutter/material.dart';
import 'package:outfitted_flutter_mobile/components/outfitted_custom_appbar.dart';
import 'package:outfitted_flutter_mobile/components/rounded_button.dart';
import 'package:outfitted_flutter_mobile/screens/register_screen.dart';
import 'package:outfitted_flutter_mobile/style/style.dart';

class LoginScreen extends StatelessWidget {
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildOutFittedCustomAppBar(
        title: 'Login',
        customIcon: Icon(Icons.search),
      ),
      backgroundColor: kBackgroundOutFitted,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
              width: MediaQuery.of(context).size.width * 0.8,
                child: FittedBox(
                  child: Image.asset('assets/images/lady_on_couch.png'),
                  fit: BoxFit.cover,
                ),
              ),
              TextFieldContainer(
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: kWhiteColor.withOpacity(0.8),
                    ),
                    hintText: 'Your Email',
                    hintStyle: TextStyle(
                      color: kWhiteColor.withOpacity(0.8),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      color: kWhiteColor.withOpacity(0.8),
                    ),
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: kWhiteColor.withOpacity(0.8),
                    ),
                    hintText: 'Your Password',
                    hintStyle: TextStyle(
                      color: kWhiteColor.withOpacity(0.8),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RoundedButton(
                buttonColor: kPrimaryColor,
                buttonText: 'LOGIN',
                press: () {},
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.6),
          borderRadius: BorderRadius.circular(30)),
      child: child,
    );
  }
}
