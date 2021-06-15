import 'package:flutter/material.dart';

import '../../Constants.dart';

class TopIconButton extends StatelessWidget {
  TopIconButton({this.press, this.title, this.icon, this.tooltip});

  String title;
  Icon icon;
  String tooltip;
  Function press;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          onPressed: press,
          tooltip: tooltip,
          iconSize: 30,
          icon: icon,
        ),
        Text(
          title,
          style: TextStyle(
            color: SecondaryColor,
          ),
        ),
      ],
    );
  }
}
