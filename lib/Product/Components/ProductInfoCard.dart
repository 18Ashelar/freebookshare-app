import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/Getters%20And%20Setters/BookInfo.dart';
import 'package:freebookshare/Product/Screens/ProductDetails.dart';

import '../../Constants.dart';
import '../../SizeConfig.dart';

class ProductInfoCard extends StatelessWidget {
  ProductInfoCard({this.bookInfo});

  final BookInfo bookInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(190),
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(15)),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, ProductDetails.id, arguments: {
            "BookInfo": bookInfo,
          });
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              // height: getProportionateScreenHeight(300),
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [kDefaultShadow],
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white),
            ),
            Positioned(
                bottom: getProportionateScreenHeight(10),
                left: getProportionateScreenWidth(10),
                child: CachedNetworkImage(
                  imageUrl: bookInfo.imgPath,
                  imageBuilder: (context, imageProvider) => Container(
                    height: getProportionateScreenHeight(170),
                    width: getProportionateScreenWidth(120),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: imageProvider,
                      ),
                      color: Colors.grey[300],
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    height: getProportionateScreenHeight(170),
                    width: getProportionateScreenWidth(120),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.grey[300],
                    ),
                  ),
                  errorWidget: (context, url, error) {
                    return Container(
                      height: getProportionateScreenHeight(170),
                      width: getProportionateScreenWidth(120),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Color(0xFFcac5ce),
                      ),
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
                )),
            Container(
              //color: Colors.blue,
              margin: EdgeInsets.only(
                  left: getProportionateScreenWidth(140),
                  right: getProportionateScreenWidth(10),
                  bottom: getProportionateScreenHeight(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Title: ",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenHeight(20),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          bookInfo.bookName ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(17),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Language: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenHeight(20),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          bookInfo.bookLanguage ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(17),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "ISBN: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenHeight(20),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          bookInfo.isbnNumber ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(17),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Location: ",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenHeight(20),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          "Mumbai",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(17),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        bookInfo.lendingType ?? "",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenHeight(20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
