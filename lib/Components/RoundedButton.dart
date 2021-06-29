import 'package:flutter/material.dart';
import 'package:freebookshare/SizeConfig.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.label, this.btnColor, this.textColor, this.press});

  Function press;
  Color btnColor, textColor;
  String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      child: Text(label),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        textStyle: TextStyle(
          fontSize: getProportionateScreenHeight(22),
        ),
        primary: btnColor,
        onPrimary: textColor,
        onSurface: Colors.grey,
      ),
    );
  }
}
