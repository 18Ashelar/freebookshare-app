import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../Constants.dart';
import '../../../SizeConfig.dart';
class BookImage extends StatelessWidget {
  String thumbnail;
  String smallThumnail;
  BookImage({this.thumbnail, this.smallThumnail});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: thumbnail != null ? thumbnail : smallThumnail,
      imageBuilder: (context, imageProvider) => Container(
        height: getProportionateScreenHeight(240),
        width: getProportionateScreenWidth(150),
        decoration: BoxDecoration(
          boxShadow: [kDefaultShadow],
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: imageProvider,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        decoration: BoxDecoration(
          color: Color(0xFFcac5ce),
          boxShadow: [kDefaultShadow],
          borderRadius: BorderRadius.circular(10),
        ),
        height: getProportionateScreenHeight(240),
        width: getProportionateScreenWidth(150),
        child: thumbnail != null || smallThumnail != null
            ? Center(
          child: CircularProgressIndicator(
            color: kPrimaryColor,
            strokeWidth: 5,
          ),
        )
            : Container(
          decoration: BoxDecoration(
            color: Color(0xFFcac5ce),
            borderRadius: BorderRadius.circular(10),
          ),
          height: getProportionateScreenHeight(240),
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
      ),
      errorWidget: (context, url, error) {
        return Container(
          decoration: BoxDecoration(
            color: Color(0xFFcac5ce),
            borderRadius: BorderRadius.circular(10),
          ),
          height: getProportionateScreenHeight(240),
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
        );
      },
    );
  }
}
