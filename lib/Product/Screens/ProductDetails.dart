import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:freebookshare/Getters%20And%20Setters/BookInfo.dart';

import '../../Constants.dart';
import '../../SizeConfig.dart';
import '../Components/BookInfoShow.dart';

class ProductDetails extends StatefulWidget {
  static String id = "Product_Details";

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //To get BookData
    final BookData =
        ModalRoute.of(context).settings.arguments as Map<String, BookInfo>;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Stack(
              children: [
                //Back Button
                Positioned(
                    left: getProportionateScreenWidth(0),
                    top: getProportionateScreenHeight(5),
                    child: Container(
                        child: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ))),

                //BackGround Container
                Container(
                  margin:
                      EdgeInsets.only(top: getProportionateScreenHeight(160)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: kBackgroundColor,
                  ),
                ),
                Positioned(
                  left: getProportionateScreenWidth(60),
                  right: getProportionateScreenWidth(60),
                  child: CachedNetworkImage(
                    imageUrl: BookData["BookInfo"].imgPath,
                    imageBuilder: (context, imageProvider) => Container(
                      height: getProportionateScreenHeight(270),
                      margin: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(30),
                          vertical: getProportionateScreenHeight(20)),
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
                      margin: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(30),
                          vertical: getProportionateScreenHeight(20)),
                      width: getProportionateScreenWidth(150),
                      height: getProportionateScreenHeight(270),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: kPrimaryColor,
                          strokeWidth: 5,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFcac5ce),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(30),
                            vertical: getProportionateScreenHeight(20)),
                        width: getProportionateScreenWidth(150),
                        height: getProportionateScreenHeight(270),
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
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: getProportionateScreenHeight(290),
                    left: getProportionateScreenWidth(15),
                    right: getProportionateScreenWidth(15),
                  ),
                  child: TabBar(
                    indicatorWeight: 3,
                    labelColor: Color(0xFFf12b96),
                    indicatorColor: Color(0xFFf12b96),
                    unselectedLabelColor: Color(0xFFef97d0),
                    tabs: [
                      Tab(
                        child: Text(
                          "Book Details",
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(20),
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Review",
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(20),
                          ),
                        ),
                      )
                    ],
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                ),
                Container(
                  height: getProportionateScreenHeight(400),
                  margin:
                      EdgeInsets.only(top: getProportionateScreenHeight(370)),
                  child: Material(
                    color: kBackgroundColor,
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          child: Container(
                            height: getProportionateScreenHeight(700),
                            margin: EdgeInsets.only(
                              top: getProportionateScreenHeight(10),
                              left: getProportionateScreenWidth(15),
                              right: getProportionateScreenWidth(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BookInfoShow(
                                  title: "Title: ",
                                  value: BookData["BookInfo"].bookName,
                                  maxLine: 1,
                                ),
                                BookInfoShow(
                                  title: "ISBN: ",
                                  value: BookData["BookInfo"].isbnNumber,
                                  maxLine: 1,
                                ),
                                BookInfoShow(
                                  title: "Created At: : ",
                                  value: BookData["BookInfo"]
                                      .createdAt
                                      .toDate()
                                      .toString(),
                                  maxLine: 1,
                                ),
                                BookInfoShow(
                                  title: "Category: ",
                                  value: BookData["BookInfo"].bookCategory,
                                  maxLine: 1,
                                ),
                                BookInfoShow(
                                  title: "Pages: ",
                                  value: BookData["BookInfo"].pageCount,
                                  maxLine: 1,
                                ),
                                BookInfoShow(
                                  title: "Published: ",
                                  value: BookData["BookInfo"].published,
                                  maxLine: 1,
                                ),
                                BookInfoShow(
                                  title: "Publisher: ",
                                  value: BookData["BookInfo"].publisher,
                                  maxLine: 1,
                                ),
                                BookInfoShow(
                                  title: "Author: ",
                                  value: BookData["BookInfo"].author,
                                  maxLine: 1,
                                ),
                                BookInfoShow(
                                  title: "Language: ",
                                  value: BookData["BookInfo"].bookLanguage,
                                  maxLine: 1,
                                ),
                                BookInfoShow(
                                  title: "Location: ",
                                  value: "Mumbai",
                                  maxLine: 1,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Description: ",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            getProportionateScreenHeight(20),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        BookData["BookInfo"].bookDescription ??
                                            "",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: TextStyle(
                                          fontSize:
                                              getProportionateScreenHeight(17),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    TextButton(
                                      child: Text("Request"),
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                          textStyle: TextStyle(
                                              fontSize:
                                                  getProportionateScreenHeight(
                                                      20)),
                                          backgroundColor: Color(0xFF7a1fa2),
                                          primary: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          )),
                                    ),
                                    Spacer(),
                                    Text(
                                      BookData["BookInfo"].lendingType ?? "",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            getProportionateScreenHeight(25),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Request Status: ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            getProportionateScreenHeight(22),
                                      ),
                                    ),
                                    Text(
                                      "Accepted.",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            getProportionateScreenHeight(20),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                    height: getProportionateScreenHeight(50),
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: null,
                                      child: Text("Chat"),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        textStyle: TextStyle(
                                          fontSize:
                                              getProportionateScreenHeight(22),
                                        ),
                                        primary: kSuccessButtonColor,
                                        onPrimary: Colors.white,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              left: getProportionateScreenWidth(15),
                              right: getProportionateScreenWidth(15),
                            ),
                            color: Colors.white)
                      ],
                      controller: _tabController,
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
