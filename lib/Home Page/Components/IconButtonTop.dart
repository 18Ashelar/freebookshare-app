import 'package:flutter/material.dart';

import '../../Constants.dart';
import '../../SizeConfig.dart';

class TopIconButton extends StatelessWidget {
  TopIconButton({this.press, this.title, this.icon, this.tooltip});

  String title;
  IconData icon;
  String tooltip;
  Function press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            icon,
            size: getProportionateScreenHeight(35),
            color: SecondaryColor,
          ),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: getProportionateScreenHeight(18),
              color: SecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
