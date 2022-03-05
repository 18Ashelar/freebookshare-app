import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

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

  static final locationPermissionSnackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: const Text('Provide location permission to share location.'),
    action: SnackBarAction(
        label: 'Settings',
        onPressed: () {
          openAppSettings();
        }),
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

  static final doubleRequestValidatorMsg = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(
      'You have already created a request.',
      style: TextStyle(
        fontSize: getProportionateScreenHeight(20),
      ),
    ),
    backgroundColor: Colors.red,
  );

  static final bookOwnerContactDetailsShow = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(
      "You can't view contact info until request is accepted.",
      style: TextStyle(
        fontSize: getProportionateScreenHeight(20),
      ),
    ),
    backgroundColor: Colors.red,
  );

  static final upcomingFeature = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(
      "Upcoming feature.",
      style: TextStyle(
        fontSize: getProportionateScreenHeight(20),
      ),
    ),
    backgroundColor: Colors.red,
  );
}
