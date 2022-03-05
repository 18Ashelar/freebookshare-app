import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:freebookshare/Components/CircularLoader.dart';
import 'package:freebookshare/Components/CustomSnackbar.dart';
import 'package:freebookshare/FirebaseServices/BookRequestNotificationService.dart';
import 'package:freebookshare/Getters%20And%20Setters/BookRequestNotification.dart';
import 'package:freebookshare/Product/Components/ProductInfoCard.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

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
  bool _isProgress = false;

  final BookRequestService service = BookRequestService();
  List<BookRequestNotification> requestInfo = [];

  BookRequestNotification requestNotification;
  Permission permission;

  String requestStatus = "";
  var geoLocator = Geolocator();

  @override
  Widget build(BuildContext context) {
    //To get BookData
    final BookData = ModalRoute.of(context).settings.arguments
        as Map<String, BookInfoWithBookId>;
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
                    imageUrl: BookData["BookInfo"].bookinfo.imgPath,
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
                  height: getProportionateScreenHeight(500),
                  margin:
                      EdgeInsets.only(top: getProportionateScreenHeight(300)),
                  child: SingleChildScrollView(
                    child: Container(
                      height: getProportionateScreenHeight(700),
                      margin: EdgeInsets.only(
                        top: getProportionateScreenHeight(10),
                        left: getProportionateScreenWidth(15),
                        bottom: getProportionateScreenHeight(10),
                        right: getProportionateScreenWidth(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BookInfoShow(
                            title: "Title: ",
                            value: BookData["BookInfo"].bookinfo.bookName,
                            maxLine: 1,
                          ),
                          BookInfoShow(
                            title: "ISBN: ",
                            value: BookData["BookInfo"].bookinfo.isbnNumber,
                            maxLine: 1,
                          ),
                          BookInfoShow(
                            title: "Created At: : ",
                            value: DateFormat.yMMMd().add_jm().format(
                                BookData["BookInfo"]
                                    .bookinfo
                                    .createdAt
                                    .toDate()),
                            maxLine: 1,
                          ),
                          BookInfoShow(
                            title: "Category: ",
                            value: BookData["BookInfo"].bookinfo.bookCategory,
                            maxLine: 1,
                          ),
                          BookInfoShow(
                            title: "Pages: ",
                            value: BookData["BookInfo"].bookinfo.pageCount,
                            maxLine: 1,
                          ),
                          BookInfoShow(
                            title: "Published: ",
                            value: BookData["BookInfo"].bookinfo.published,
                            maxLine: 1,
                          ),
                          BookInfoShow(
                            title: "Publisher: ",
                            value: BookData["BookInfo"].bookinfo.publisher,
                            maxLine: 1,
                          ),
                          BookInfoShow(
                            title: "Author: ",
                            value: BookData["BookInfo"].bookinfo.author,
                            maxLine: 1,
                          ),
                          BookInfoShow(
                            title: "Language: ",
                            value: BookData["BookInfo"].bookinfo.bookLanguage,
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
                                  fontSize: getProportionateScreenHeight(20),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  BookData["BookInfo"]
                                          .bookinfo
                                          .bookDescription ??
                                      "",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 10,
                                  style: TextStyle(
                                    fontSize: getProportionateScreenHeight(17),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Lending Type:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenHeight(20),
                                ),
                              ),
                              Spacer(),
                              Text(
                                BookData["BookInfo"].bookinfo.lendingType ?? "",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenHeight(23),
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
                                  fontSize: getProportionateScreenHeight(22),
                                ),
                              ),
                              StreamBuilder<
                                      QuerySnapshot<BookRequestNotification>>(
                                  stream: service.getSingleRequest(
                                      BookData["BookInfo"].bookId),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData &&
                                        snapshot.data.docs.length != 0) {
                                      requestInfo = snapshot.data.docs
                                          .map((e) => e.data())
                                          .toList();
                                      requestStatus =
                                          requestInfo[0].requestStatus;
                                      print("Akshay : " + requestStatus);
                                      return Text(
                                        requestStatus ?? " ",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              getProportionateScreenHeight(20),
                                        ),
                                      );
                                    }

                                    if (snapshot.hasError) {
                                      return Text(
                                        " ",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              getProportionateScreenHeight(20),
                                        ),
                                      );
                                    }

                                    return Container(
                                        child: Text(requestStatus));
                                  }),
                            ],
                          ),
                          Container(
                              height: getProportionateScreenHeight(50),
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (requestStatus.isNotEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        CustomSnackbar
                                            .doubleRequestValidatorMsg);
                                  } else {
                                    var permissionStatus =
                                        await Permission.location.status;

                                    if (!permissionStatus.isGranted) {
                                      await Permission.location.request();
                                    }

                                    if (await Permission.location.isGranted) {
                                      setState(() {
                                        _isProgress = true;
                                      });
                                      Geolocator.getCurrentPosition(
                                              desiredAccuracy:
                                                  LocationAccuracy.high)
                                          .then((value) {
                                        requestNotification =
                                            BookRequestNotification(
                                          requestReceiverUserId:
                                              BookData["BookInfo"]
                                                  .bookinfo
                                                  .userId,
                                          requestSenderUserId: service.uid(),
                                          requestStatus: "Pending",
                                          bookId: BookData["BookInfo"].bookId,
                                          latitude: value.latitude.toString(),
                                          longitude: value.longitude.toString(),
                                          createdAt: Timestamp.now(),
                                        );

                                        service.bookRequest
                                            .add(requestNotification)
                                            .then((value) {
                                          setState(() {
                                            _isProgress = false;
                                          });
                                          print("Added");
                                        }).onError((error, stackTrace) {
                                          setState(() {
                                            _isProgress = false;
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                                  CustomSnackbar.errorSnackBar);
                                        });
                                      }).onError((error, stackTrace) {
                                        setState(() {
                                          _isProgress = false;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                                CustomSnackbar.errorSnackBar);
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(CustomSnackbar
                                              .locationPermissionSnackBar);
                                    }
                                  }
                                },
                                child: Text("Request"),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  textStyle: TextStyle(
                                    fontSize: getProportionateScreenHeight(22),
                                  ),
                                  primary: Color(0xFF7a1fa2),
                                  onPrimary: Colors.white,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                (_isProgress) ? CircularLoading() : Center()
              ],
            )),
          ],
        ),
      ),
    );
  }
}
