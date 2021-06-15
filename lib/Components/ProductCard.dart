import "package:flutter/material.dart";
import 'package:freebookshare/SizeConfig.dart';

class ProductCard extends StatelessWidget {
  ProductCard({this.imgPath});
  String imgPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(20),
          top: getProportionateScreenHeight(10)),
      child: Container(
        height: getProportionateScreenHeight(200),
        width: getProportionateScreenWidth(150),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(imgPath),
          ),
          //borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
