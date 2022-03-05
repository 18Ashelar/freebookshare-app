import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/Constants.dart';
import 'package:freebookshare/Login%20and%20Registration/Components/DisplayError.dart';
import 'package:freebookshare/Login%20and%20Registration/Components/LoginInputFormField.dart';
import 'package:freebookshare/Login%20and%20Registration/Components/StartUpImage.dart';
import 'package:freebookshare/MainScreen.dart';
import 'package:freebookshare/SizeConfig.dart';

import '../../Components/RoundedButton.dart';
import '../FirebaseAuthenticationServices.dart';
import 'RegisterScreen.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login_Screen';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  String loginError = null;
  bool _isProgress = false;

  TextEditingController _loginEmailContoller = TextEditingController();
  TextEditingController _loginPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: size.height,
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(20),
                    horizontal: getProportionateScreenWidth(35)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    DisplayError(
                      registrationStatus: loginError,
                      pageName: "Login",
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    StartUpImage(),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Form(
                      key: _loginFormKey,
                      child: Column(
                        children: [
                          InputTextField(
                            controller: _loginEmailContoller,
                            hintText: "Enter your email",
                            textInputType: TextInputType.emailAddress,
                            textAlign: TextAlign.center,
                            obscureText: false,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          Column(
                            children: [
                              InputTextField(
                                controller: _loginPasswordController,
                                hintText: "Enter your password",
                                textInputType: TextInputType.emailAddress,
                                textAlign: TextAlign.center,
                                obscureText: true,
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              Container(
                                alignment: Alignment(1.0, 0.0),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, MainScreen.id);
                                    },
                                    child: Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize:
                                            getProportionateScreenHeight(18),
                                        color: Color(0xFFab47bc),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(40),
                          ),
                          Container(
                              height: getProportionateScreenHeight(60),
                              width: double.infinity,
                              child: RoundedButton(
                                label: "Log In",
                                btnColor: kPrimaryButtonColor,
                                textColor: Colors.white,
                                press: login,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(20),
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, RegisterPage.id);
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: getProportionateScreenHeight(18),
                                color: Color(0xFFab47bc),
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
              (_isProgress)
                  ? Container(
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: kPrimaryColor,
                          strokeWidth: 5,
                        ),
                      ),
                    )
                  : Center()
            ],
          ),
        ),
      ),
    );
  }

  Future login() async {
    try {
      setState(() {
        _isProgress = true;
      });
      dynamic result = await AuthenticationService()
          .userSignIn(_loginEmailContoller.text, _loginPasswordController.text);
      Navigator.of(context).pushReplacementNamed(MainScreen.id);
    } on FirebaseAuthException catch (e) {
      setState(() {
        setState(() {
          _isProgress = false;
        });
        loginError = e.message;
        // print("--------------------------------------------$loginError");
      });
    } catch (e) {
      setState(() {
        _isProgress = false;
      });
      print(e.toString());
    }
  }
}
