import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/Getters%20And%20Setters/BookDetailsAndBookId.dart';
import 'package:freebookshare/Getters%20And%20Setters/BookInfo.dart';
import 'package:freebookshare/Product/Screens/AddBookForm.dart';

import '../../../Constants.dart';
import '../../../SizeConfig.dart';

class MyBookCard extends StatelessWidget {
  final BookInfo bookInfo;
  final String bookId;

  const MyBookCard({this.bookInfo, this.bookId});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(150),
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(15)),
      height: getProportionateScreenHeight(245),
      child: Stack(
        children: [
          Container(
            height: getProportionateScreenHeight(207),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(29),
              boxShadow: [kDefaultShadow],
            ),
          ),
          CachedNetworkImage(
            imageUrl: bookInfo.imgPath,
            imageBuilder: (context, imageProvider) => Container(
              height: getProportionateScreenHeight(170),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: imageProvider,
                ),
                color: Colors.grey[300],
              ),
            ),
            placeholder: (context, url) => Container(
              height: getProportionateScreenHeight(170),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
                color: Colors.grey[300],
              ),
            ),
            errorWidget: (context, url, error) {
              return Container(
                height: getProportionateScreenHeight(170),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                  ),
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
          ),
          Positioned(
            top: getProportionateScreenHeight(170),
            child: Container(
              width: getProportionateScreenWidth(150),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AddBookForm.id,
                          arguments: BookDetailsAndBookId(
                              info: bookInfo, bookId: bookId));
                    },
                    child: Container(
                      width: getProportionateScreenWidth(70),
                      padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(10)),
                      alignment: Alignment.center,
                      child: Text("Edit"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(10)),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Delete",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
