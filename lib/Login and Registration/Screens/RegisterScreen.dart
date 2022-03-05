import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/Components/CircularLoader.dart';
import 'package:freebookshare/Constants.dart';
import 'package:freebookshare/Login%20and%20Registration/Components/DisplayError.dart';
import 'package:freebookshare/Login%20and%20Registration/Components/LoginInputFormField.dart';
import 'package:freebookshare/Login%20and%20Registration/Components/StartUpImage.dart';
import 'package:freebookshare/Login%20and%20Registration/Components/Validation.dart';
import 'package:freebookshare/Login%20and%20Registration/Screens/LoginPage.dart';
import 'package:freebookshare/SizeConfig.dart';

import '../../Components/RoundedButton.dart';
import '../FirebaseAuthenticationServices.dart';

class RegisterPage extends StatefulWidget {
  static const String id = "Register_screen";

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String registrationStatus = null;
  bool _isProgress = false;
  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _RetypedPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
                //color: Colors.green,
                width: double.infinity,
                height: size.height,
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(20),
                    horizontal: getProportionateScreenWidth(30)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DisplayError(
                        registrationStatus: registrationStatus,
                        pageName: "Register",
                      ),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      StartUpImage(),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      //Email Field
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            InputTextField(
                                controller: _emailContoller,
                                validator: Validator.emailValidation,
                                hintText: "Enter your email",
                                textInputType: TextInputType.emailAddress,
                                textAlign: TextAlign.center,
                                obscureText: false),
                            SizedBox(height: getProportionateScreenHeight(15)),
                            //Password Field
                            InputTextField(
                              controller: _passwordController,
                              validator: Validator.passwordValidation,
                              textInputType: TextInputType.text,
                              obscureText: true,
                              textAlign: TextAlign.center,
                              hintText: 'Enter your password',
                            ),
                            SizedBox(height: getProportionateScreenHeight(15)),
                            //confirm password
                            InputTextField(
                              controller: _RetypedPasswordController,
                              validator: Validator.confirmPasswordValidation,
                              obscureText: true,
                              textInputType: TextInputType.text,
                              textAlign: TextAlign.center,
                              hintText: 'Confirm password.',
                            ),
                            SizedBox(height: getProportionateScreenHeight(15)),
                            Container(
                                height: getProportionateScreenHeight(60),
                                width: double.infinity,
                                child: RoundedButton(
                                  label: "Register",
                                  btnColor: kPrimaryButtonColor,
                                  textColor: Colors.white,
                                  press: submit,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            (_isProgress) ? CircularLoading() : Center()
          ],
        ),
      ),
    );
  }

  bool validate() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void submit() async {
    if (validate()) {
      try {
        setState(() {
          _isProgress = true;
        });
        dynamic result = await AuthenticationService()
            .createNewUser(_emailContoller.text, _passwordController.text);

        showCustomDialog(context,
            "Congratulations, your account has been created successfully.");
        setState(() {
          _isProgress = false;
        });
      } catch (error) {
        setState(() {
          setState(() {
            _isProgress = false;
          });
          registrationStatus = error.message;
          print(registrationStatus);
        });
      }
    }
  }

  //Show dialog after book uploaded successfully...........
  Future showCustomDialog(BuildContext context, String title) => showModal(
        configuration: FadeScaleTransitionConfiguration(
          barrierDismissible: false,
          transitionDuration: Duration(seconds: 1),
        ),
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: Color(0xFF515C6E),
          elevation: 25,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          title: Container(
              height: getProportionateScreenHeight(150),
              padding: EdgeInsets.all(getProportionateScreenWidth(30)),
              decoration: BoxDecoration(
                // color: Color(0xFF515C6E),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF01CC72),
                ),
                child: Hero(
                  tag: "preview",
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: getProportionateScreenHeight(50),
                  ),
                ),
              )),
          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          content: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Great!",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(22),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(10),
                          horizontal: getProportionateScreenWidth(40)),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(14)),
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Container(
                      width: getProportionateScreenWidth(180),
                      height: getProportionateScreenHeight(50),
                      child: RoundedButton(
                        press: () {
                          Navigator.pop(context);

                          Navigator.of(context)
                              .pushReplacementNamed(LoginPage.id);
                        },
                        label: "Proceed to login >>",
                        btnColor: kPrimaryButtonColor,
                      ))
                ],
              )),
        ),
      );
}
