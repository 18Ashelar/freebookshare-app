import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/Product/BookUploadFromInternet/Components/BookJsonDataModel.dart';

import '../../../Constants.dart';
import '../../../SizeConfig.dart';
import '../BookDetails.dart';

class BookInfoCard extends StatelessWidget {
  BookInfoCard({this.bookData});
  final BookData bookData;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(190),
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(15)),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, BookDetails.id, arguments: {
            "BookData": bookData,
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
                  imageUrl: bookData.volume.imageLinks.thumbnail != null
                      ? bookData.volume.imageLinks.thumbnail
                      : bookData.volume.imageLinks.smallThumbnail,
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
                          bookData.volume.title ?? "",
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
                        "Author: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenHeight(20),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          bookData.volume.authors[0] ?? "",
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
                        "Published: ",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenHeight(20),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          bookData.volume.publishedDate,
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
                          bookData.volume.industryIdentifiers[0].identifier ??
                              "",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(17),
                          ),
                        ),
                      )
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
