import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:freebookshare/Getters%20And%20Setters/BookInfo.dart';
import 'package:freebookshare/Product/Screens/ProductDetails.dart';
import 'package:freebookshare/SizeConfig.dart';

import '../../Constants.dart';

class ProductCard extends StatelessWidget {
  ProductCard({this.bookInfo});
  final BookInfo bookInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(20),
          top: getProportionateScreenHeight(10)),
      child: CachedNetworkImage(
        imageUrl: bookInfo.imgPath,
        imageBuilder: (context, imageProvider) => InkWell(
          onTap: () {
            Navigator.pushNamed(context, ProductDetails.id,
                arguments: {"BookInfo": bookInfo});
          },
          child: Container(
            width: getProportionateScreenWidth(150),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: imageProvider,
              ),
            ),
          ),
        ),
        placeholder: (context, url) => Container(
          color: Color(0xFFcac5ce),
          height: getProportionateScreenHeight(210),
          width: getProportionateScreenWidth(150),
          child: Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
              strokeWidth: 5,
            ),
          ),
        ),
        errorWidget: (context, url, error) {
          return ErrorImagePlaceholder(
            bookInfo: bookInfo,
          );
        },
      ),
    );
  }
}

class ErrorImagePlaceholder extends StatelessWidget {
  ErrorImagePlaceholder({this.bookInfo});
  final BookInfo bookInfo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetails.id, arguments: {
          "BookInfo": bookInfo,
        });
      },
      child: Container(
        color: Color(0xFFcac5ce),
        height: getProportionateScreenHeight(210),
        width: getProportionateScreenWidth(150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image_rounded,
              color: Color(0xFF737373),
              size: getProportionateScreenHeight(45),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text(
              "Book Image",
              style: TextStyle(
                color: Color(0xFF737373),
                fontSize: getProportionateScreenHeight(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text(
              "Not Found",
              style: TextStyle(
                color: Color(0xFF737373),
                fontSize: getProportionateScreenHeight(20),
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
