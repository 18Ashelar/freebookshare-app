import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/Constants.dart';
import 'package:freebookshare/SizeConfig.dart';
import 'Components/RoundedButton.dart';
import 'HomeScreen.dart';

class RegisterPage extends StatelessWidget {
  static const String id = "Register_screen";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Container(
            width: double.infinity,
            height: size.height,
            padding: EdgeInsets.symmetric(vertical:getProportionateScreenHeight(20),horizontal: getProportionateScreenWidth(30)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Create An account, It's free",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                //Email Field
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    // email = value;
                  },
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
                ),
                //Password Field
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //  password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password'),
                ),
                //confirm password
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //  password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Confirm password.'),
                ),
                //Enter Your City Name
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //  password = value;
                  },
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'Enter your City'),
                ),

                //Enter Your Pin Code
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    //  password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your Pin Code'),
                ),
                Container(
                    height: size.height * 0.07,
                    width: double.infinity,
                    child: RoundedButton(
                      label: "Register",
                      btnColor:kPrimaryButtonColor,
                      textColor: Colors.white,
                      press: () {
                        Navigator.pushNamed(context, HomeScreen.id);
                      },
                    ))
              ],
            )),
      ),
    );
  }
}
