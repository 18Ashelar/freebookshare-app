import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/Constants.dart';
import 'package:freebookshare/LoginPage.dart';
import 'package:freebookshare/RegisterScreen.dart';
import 'package:freebookshare/SizeConfig.dart';
import 'Components/RoundedButton.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: size.height,
          padding: EdgeInsets.symmetric(vertical:getProportionateScreenHeight(20),horizontal: getProportionateScreenWidth(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Welcome",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Free Book Share app provide platform to share your books free of cost.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey[700],
                ),
              ),
              Container(
                width: double.infinity,
                height: size.height / 2,
                child: Image.asset(
                  "assets/fbsLogo.png",
                ),
              ),
              Container(
                  height: size.height * 0.07,
                  width: double.infinity,
                  child: RoundedButton(
                    label: "Log In",
                    btnColor: kPrimaryButtonColor,
                    textColor: Colors.white,
                    press: () {
                      Navigator.pushNamed(context, LoginPage.id);
                    },
                  )),
              SizedBox(height: 50.0),
              Container(
                  height: size.height * 0.07,
                  width: double.infinity,
                  child: RoundedButton(
                    label: "Register",
                    btnColor:kSecondaryButtonColor,
                    textColor: Colors.black,
                    press: () {
                      Navigator.pushNamed(context, RegisterPage.id);
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
