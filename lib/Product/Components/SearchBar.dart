import 'package:flutter/material.dart';

import '../../Constants.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
          top: 10.0,
          bottom: kDefaultPadding),
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white.withOpacity(0.4)),
      child: TextField(
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.white,
        ),
        decoration: InputDecoration(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 30.0,
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: "Search",
            hintStyle: TextStyle(
              color: Colors.white,
            )),
      ),
    );
  }
}
