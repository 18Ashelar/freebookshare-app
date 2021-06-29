import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/Constants.dart';
import 'package:freebookshare/Login%20and%20Registration/Components/DisplayError.dart';
import 'package:freebookshare/Login%20and%20Registration/Components/LoginInputFormField.dart';
import 'package:freebookshare/Login%20and%20Registration/Components/StartUpImage.dart';
import 'package:freebookshare/Login%20and%20Registration/Components/Validation.dart';
import 'package:freebookshare/SizeConfig.dart';

import '../../Components/RoundedButton.dart';
import '../../HomeScreen.dart';
import '../FirebaseAuthenticationServices.dart';

class RegisterPage extends StatefulWidget {
  static const String id = "Register_screen";

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String registrationStatus = null;

  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _RetypedPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
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
        dynamic result = await AuthenticationService()
            .createNewUser(_emailContoller.text, _passwordController.text);
        Navigator.of(context).pushReplacementNamed(HomeScreen.id);
      } catch (error) {
        setState(() {
          registrationStatus = error.message;
          print(registrationStatus);
        });
      }
    }
  }
}
