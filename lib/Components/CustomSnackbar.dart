import 'package:flutter/material.dart';

import '../Constants.dart';
import '../SizeConfig.dart';

class CustomSnackbar {
  static final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(
      'Your profile has been updated successfully.',
      style: TextStyle(
        fontSize: getProportionateScreenHeight(20),
      ),
    ),
    backgroundColor: kSuccessButtonColor,
  );

  static final errorSnackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(
      'Something went wrong. Please check your internet connectivity.',
      style: TextStyle(
        fontSize: getProportionateScreenHeight(20),
      ),
    ),
    backgroundColor: Colors.red,
  );

  static final profilePhotoValidateSnackbar = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(
      'Please upload profile photo.',
      style: TextStyle(
        fontSize: getProportionateScreenHeight(20),
      ),
    ),
    backgroundColor: Colors.red,
  );

  static final bookPhotoValidateSnackbar = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(
      'Please upload book image.',
      style: TextStyle(
        fontSize: getProportionateScreenHeight(20),
      ),
    ),
    backgroundColor: Colors.red,
  );
}
