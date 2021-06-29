import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';
import '../SizeConfig.dart';

class ImageZoomTap extends StatelessWidget {
  static String id = "ImageZoomTap";
  ImageZoomTap({this.imgUrl});
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              placeholder: (context, url) => Container(
                color: Colors.black,
                child: Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                    strokeWidth: 6,
                  ),
                ),
              ),
              errorWidget: (context, url, error) {
                return SizedBox(
                  height: getProportionateScreenHeight(150),
                  width: getProportionateScreenWidth(150),
                  child: CircleAvatar(
                    backgroundColor: Color(0xFFE0E0E0),
                    child: Icon(
                      Icons.warning_outlined,
                      size: getProportionateScreenHeight(50),
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
