import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freebookshare/Constants.dart';
import 'package:freebookshare/Login%20and%20Registration/Components/HeaderText.dart';
import 'package:freebookshare/Login%20and%20Registration/Screens/LoginPage.dart';
import 'package:freebookshare/Login%20and%20Registration/Screens/RegisterScreen.dart';
import 'package:freebookshare/SizeConfig.dart';

import 'Components/RoundedButton.dart';
import 'Login and Registration/Components/StartUpImage.dart';

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

    return WillPopScope(
      onWillPop: () async {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: size.height,
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(30),
                horizontal: getProportionateScreenWidth(30)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                HeaderText(
                    header1: "Welcome",
                    header2:
                        "Free Book Share app provide platform to share your books free of cost."),
                StartUpImage(),
                Container(
                    height: getProportionateScreenHeight(60),
                    width: double.infinity,
                    child: RoundedButton(
                      label: "Log In",
                      btnColor: kPrimaryButtonColor,
                      textColor: Colors.white,
                      press: () {
                        Navigator.pushNamed(context, LoginPage.id);
                      },
                    )),
                Container(
                    height: getProportionateScreenHeight(60),
                    width: double.infinity,
                    child: RoundedButton(
                      label: "Register",
                      btnColor: kSecondaryButtonColor,
                      textColor: Colors.black,
                      press: () {
                        Navigator.pushNamed(context, RegisterPage.id);
                      },
                    )),
                SizedBox(height: getProportionateScreenHeight(5)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
