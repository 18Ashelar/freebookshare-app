import 'package:flutter/material.dart';
import 'package:freebookshare/SizeConfig.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: getProportionateScreenWidth(20),
          right: getProportionateScreenWidth(20),
          top: getProportionateScreenHeight(15),
          bottom: getProportionateScreenHeight(20)),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(5)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white.withOpacity(0.4)),
      child: TextField(
        style: TextStyle(
          fontSize: getProportionateScreenHeight(20),
          color: Colors.white,
        ),
        decoration: InputDecoration(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: getProportionateScreenHeight(30),
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
