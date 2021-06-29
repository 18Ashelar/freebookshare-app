import 'package:flutter/material.dart';
import 'package:freebookshare/SizeConfig.dart';

import 'HeaderText.dart';

class DisplayError extends StatefulWidget {
  DisplayError({this.registrationStatus, this.pageName});
  String registrationStatus;
  String pageName;

  @override
  _DisplayErrorState createState() => _DisplayErrorState();
}

class _DisplayErrorState extends State<DisplayError> {
  String errorText;
  Widget build(BuildContext context) {
    if (widget.registrationStatus != null) {
      if (widget.registrationStatus ==
          "There is no user record corresponding to this identifier. The user may have been deleted.") {
        errorText = "Incorrect username.";
      } else if (widget.registrationStatus ==
          "The password is invalid or the user does not have a password.") {
        errorText = "Incorrect password.";
      } else if (widget.registrationStatus ==
          "The email address is badly formatted.") {
        errorText = "Invalid email format.";
      } else if (widget.registrationStatus ==
          "The user account has been disabled by an administrator.") {
        errorText = "Your account has been disabled.";
      } else if (widget.registrationStatus ==
          "The email address is already in use by another account.") {
        errorText = "Account already exists.";
      } else if (widget.registrationStatus ==
          "A network error (such as timeout, interrupted connection or unreachable host) has occurred.") {
        errorText = "Please check your internet connection.";
      } else {
        errorText = "Username or password is empty.";
      }
      return Container(
        color: Colors.amberAccent,
        height: getProportionateScreenHeight(80),
        width: double.infinity,
        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
              child: Icon(
                Icons.error_outline,
                size: getProportionateScreenHeight(30),
              ),
            ),
            Expanded(
              child: Text(
                errorText,
                maxLines: 2,
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  size: getProportionateScreenHeight(30),
                ),
                onPressed: () {
                  setState(() {
                    widget.registrationStatus = null;
                  });
                },
              ),
            )
          ],
        ),
      );
    } else {
      if (widget.pageName == "Login") {
        return HeaderText(
          header1: "Log In",
          header2: "Sign in to your account",
        );
      } else {
        return HeaderText(
            header1: "Sign Up", header2: "Create an account, It's free ");
      }
    }
  }
}
