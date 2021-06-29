import 'package:flutter/material.dart';

import '../../SizeConfig.dart';

class HeaderText extends StatelessWidget {
  HeaderText({this.header1, this.header2});
  final String header1;
  final String header2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          header1,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenHeight(30),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Text(
          header2,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getProportionateScreenHeight(18),
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
