import 'package:flutter/material.dart';

import '../../Constants.dart';
import '../../SizeConfig.dart';

class InputTextField extends StatelessWidget {
  const InputTextField(
      {Key key,
      this.validator,
      @required TextEditingController controller,
      @required this.hintText,
      @required this.textInputType,
      @required this.textAlign,
      @required this.obscureText})
      : _loginEmailContoller = controller,
        super(key: key);

  final TextEditingController _loginEmailContoller;
  final String hintText;
  final TextInputType textInputType;
  final TextAlign textAlign;
  final bool obscureText;
  final Function validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      style: TextStyle(fontSize: getProportionateScreenHeight(18)),
      controller: _loginEmailContoller,
      keyboardType: textInputType,
      textAlign: textAlign,
      decoration: kTextFieldDecoration.copyWith(
          errorStyle: TextStyle(
            fontSize: getProportionateScreenHeight(15),
          ),
          contentPadding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(20),
              horizontal: getProportionateScreenWidth(20)),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: getProportionateScreenHeight(18),
          )),
      obscureText: obscureText,
    );
  }
}
