import 'package:flutter/material.dart';
import 'package:freebookshare/SizeConfig.dart';

class BookInfoShow extends StatelessWidget {
  BookInfoShow({this.title, this.value, this.maxLine});

  final String title;
  final String value;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenHeight(20),
          ),
        ),
        Flexible(
          child: Text(
            value ?? "",
            overflow: TextOverflow.ellipsis,
            maxLines: maxLine,
            style: TextStyle(
              fontSize: getProportionateScreenHeight(17),
            ),
          ),
        )
      ],
    );
  }
}
