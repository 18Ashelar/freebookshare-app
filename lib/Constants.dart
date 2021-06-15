import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color:kPrimaryColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color:kPrimaryColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const List<String> imgList = [
  "assets/3.jpg",
  "assets/1.jpg",
  "assets/a.jpg",
  "assets/bcd.jpg",
  "assets/book.jpg",
  "assets/abc.jpg",
  "assets/2.jpg",
];

const List<String> bookimgList = [
  "assets/bookImage/a.jpg",
  "assets/bookImage/d.jpg",
  "assets/bookImage/3.jpg",
  "assets/bookImage/4.jpg",
  "assets/bookImage/5.jpg",
  "assets/bookImage/6.jpg",
  "assets/bookImage/7.jpg",
  "assets/bookImage/8.jpg",
  "assets/bookImage/9.jpg",
];
const kBackgroundColor = Color(0xFFF3E5F5);
const kSecondaryColor = Color(0xFF979797);
const kDefaultPadding = 20.0;
const kPrimaryColor = Color(0xFF9C27B0);
const SecondaryColor = Color(0xFFE1BEE7);
const kPrimaryButtonColor=Color(0xFF9C27B0);
const kSecondaryButtonColor=Color(0xFFe1bee7);
const kSuccessButtonColor=Color(0xFF3cb027);
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);
