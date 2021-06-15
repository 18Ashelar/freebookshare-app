import 'package:flutter/material.dart';
import 'package:freebookshare/Constants.dart';
import 'package:freebookshare/RegisterScreen.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'Components/RoundedButton.dart';
import 'package:freebookshare/SizeConfig.dart';


class LoginPage extends StatefulWidget {
  static const String id = 'login_Screen';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isKeyboardOpen = false;

  @protected
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _isKeyboardOpen = visible;
        });
      },
    );
  }

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
              _isKeyboardOpen
                  ? Container()
                  : Column(
                      children: [
                        Text(
                          "Log In",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Sign In to your Account.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    width: double.infinity,
                    height: size.height / 2,
                    child: Image.asset(
                      "assets/fbsLogo.png",
                    ),
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  // email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                alignment: Alignment(1.0, 0.0),
                child: TextButton(
                    onPressed: null,
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 15.0,
                        color:Color(0xFFab47bc),
                      ),
                    )),
              ),
              Container(
                  height: size.height * 0.07,
                  width: double.infinity,
                  child: RoundedButton(
                    label: "Log In",
                    btnColor:kPrimaryButtonColor,
                    textColor: Colors.white,
                    press: () {},
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterPage.id);
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 15.0,
                          color:Color(0xFFab47bc),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
