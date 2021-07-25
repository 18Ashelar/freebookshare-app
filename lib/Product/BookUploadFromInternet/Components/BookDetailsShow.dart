import 'package:flutter/material.dart';

import '../../../SizeConfig.dart';

class BookDetailsShow extends StatelessWidget {
  final String title;
  final String value;

  BookDetailsShow({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenHeight(18),
          ),
        ),
        Flexible(
          child: Text(
            value ?? "",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: getProportionateScreenHeight(15),
            ),
          ),
        ),
      ],
    );
  }
}
