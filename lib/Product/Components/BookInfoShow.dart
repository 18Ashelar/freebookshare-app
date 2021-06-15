import 'package:flutter/material.dart';

class BookInfoShow extends StatelessWidget {
  BookInfoShow({this.title, this.value, this.maxLine});

  String title;
  String value;
  int maxLine;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        Flexible(
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            maxLines: maxLine,
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
        )
      ],
    );
  }
}
