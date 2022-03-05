import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/Components/RoundedButton.dart';
import 'package:freebookshare/FirebaseServices/BookFirebaseService.dart';
import 'package:freebookshare/FirebaseServices/BookRequestNotificationService.dart';
import 'package:freebookshare/Getters%20And%20Setters/BookRequestNotification.dart';
import 'package:freebookshare/Request/Screens/CurrentLocationOnMap.dart';
import 'package:intl/intl.dart';

import '../../Constants.dart';
import '../../SizeConfig.dart';

class MyBookRequestCard extends StatelessWidget {
  MyBookRequestCard({this.bookRequestNotification, this.bookId});

  final BookRequestNotification bookRequestNotification;
  final String bookId;
  final BookRequestService requestService = BookRequestService();

  BookFirebaseService service = BookFirebaseService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future:
            BookFirebaseService.users.doc(bookRequestNotification.bookId).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData) {
            Map<String, dynamic> data =
                snapshot.data.data() as Map<String, dynamic>;

            if (data == null) {
              print("AKshayy Shelar");

              return Container(
                height: getProportionateScreenHeight(200),
                margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15),
                    vertical: getProportionateScreenHeight(15)),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      // height: getProportionateScreenHeight(600),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [kDefaultShadow],
                      ),
                    ),
                    Positioned(
                      top: getProportionateScreenHeight(20),
                      child: Container(
                          child: Column(
                        children: [
                          Text("Book not found.",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenHeight(25))),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          Text("Please close the book request.",
                              style: TextStyle(
                                  fontSize: getProportionateScreenHeight(20))),
                          SizedBox(
                            height: getProportionateScreenHeight(30),
                          ),
                          Container(
                              height: getProportionateScreenHeight(50),
                              width: getProportionateScreenWidth(120),
                              child: RoundedButton(
                                label: "Close",
                                btnColor: kPrimaryButtonColor,
                                textColor: Colors.white,
                                press: () {
                                  requestService.updateBookRequest(
                                      bookId, "Rejected");
                                },
                              )),
                        ],
                      )),
                    ),
                    // Positioned(
                    //   bottom: getProportionateScreenHeight(10),
                    //   left: getProportionateScreenWidth(10),
                    //   child: CachedNetworkImage(
                    //     imageUrl: "",
                    //     imageBuilder: (context, imageProvider) => Container(
                    //       height: getProportionateScreenHeight(180),
                    //       width: getProportionateScreenWidth(120),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(10),
                    //         image: DecorationImage(
                    //             fit: BoxFit.fill, image: imageProvider),
                    //       ),
                    //     ),
                    //     placeholder: (context, url) => Container(
                    //       decoration: BoxDecoration(
                    //         color: Color(0xFFcac5ce),
                    //         boxShadow: [kDefaultShadow],
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       height: getProportionateScreenHeight(180),
                    //       width: getProportionateScreenWidth(120),
                    //     ),
                    //     errorWidget: (context, url, error) {
                    //       return Container(
                    //         height: getProportionateScreenHeight(180),
                    //         width: getProportionateScreenWidth(120),
                    //         decoration: BoxDecoration(
                    //           color: Color(0xFFcac5ce),
                    //           borderRadius: BorderRadius.circular(10),
                    //         ),
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Icon(
                    //               Icons.image_rounded,
                    //               color: Color(0xFF737373),
                    //               size: getProportionateScreenHeight(45),
                    //             ),
                    //             SizedBox(
                    //               height: getProportionateScreenHeight(10),
                    //             ),
                    //             Text(
                    //               "Book Image",
                    //               style: TextStyle(
                    //                 color: Color(0xFF737373),
                    //                 fontSize: getProportionateScreenHeight(20),
                    //                 fontWeight: FontWeight.bold,
                    //               ),
                    //             ),
                    //             SizedBox(
                    //               height: getProportionateScreenHeight(10),
                    //             ),
                    //             Text(
                    //               "Not Found",
                    //               style: TextStyle(
                    //                 color: Color(0xFF737373),
                    //                 fontSize: getProportionateScreenHeight(20),
                    //                 fontWeight: FontWeight.bold,
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    // YourBookRequestData(
                    //   data: data,
                    //   bookRequestNotification: bookRequestNotification,
                    //   bookRequestId: bookId,
                    // )
                  ],
                ),
              );
            } else {
              return Container(
                height: getProportionateScreenHeight(200),
                margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15),
                    vertical: getProportionateScreenHeight(15)),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      // height: getProportionateScreenHeight(600),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          boxShadow: [kDefaultShadow], color: Colors.white),
                    ),
                    Positioned(
                      bottom: getProportionateScreenHeight(10),
                      left: getProportionateScreenWidth(10),
                      child: CachedNetworkImage(
                        imageUrl: data["image_path"],
                        imageBuilder: (context, imageProvider) => Container(
                          height: getProportionateScreenHeight(180),
                          width: getProportionateScreenWidth(120),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.fill, image: imageProvider),
                          ),
                        ),
                        placeholder: (context, url) => Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFcac5ce),
                            boxShadow: [kDefaultShadow],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: getProportionateScreenHeight(180),
                          width: getProportionateScreenWidth(120),
                        ),
                        errorWidget: (context, url, error) {
                          return Container(
                            height: getProportionateScreenHeight(180),
                            width: getProportionateScreenWidth(120),
                            decoration: BoxDecoration(
                              color: Color(0xFFcac5ce),
                              borderRadius: BorderRadius.circular(10),
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
                    ),
                    YourBookRequestData(
                      data: data,
                      bookRequestNotification: bookRequestNotification,
                      bookRequestId: bookId,
                    )
                  ],
                ),
              );
            }
          }

          return Container();
        });
  }
}

class YourBookRequestData extends StatelessWidget {
  YourBookRequestData(
      {this.data, this.bookRequestNotification, this.bookRequestId});
  final Map<String, dynamic> data;
  final BookRequestNotification bookRequestNotification;
  final String bookRequestId;
  final BookRequestService requestService = BookRequestService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: BookFirebaseService.usersData
            .doc(bookRequestNotification.requestSenderUserId)
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          }
          if (snapshot.hasData) {
            Map<String, dynamic> UserData =
                snapshot.data.data() as Map<String, dynamic>;
            Map<String, dynamic> Contact =
                UserData["contact"] as Map<String, dynamic>;
            return Container(
              // color: Colors.green,
              margin: EdgeInsets.only(
                  left: getProportionateScreenWidth(140),
                  right: getProportionateScreenWidth(5),
                  bottom: getProportionateScreenHeight(5)),
              child: Column(
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(top: getProportionateScreenHeight(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Text(
                            DateFormat.yMMMd().add_jm().format(
                                bookRequestNotification.createdAt.toDate()),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: getProportionateScreenHeight(15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title: ",
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(18),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          (data == null ? "" : data["title"]),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Name: ",
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(18))),
                      Flexible(
                        child: Text(
                          UserData["firstname"] + " " + UserData["lastname"],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Phone no: ",
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(18))),
                      Flexible(
                        child: Text(
                          Contact["phone_no"],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Location: ",
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(18))),
                      GestureDetector(
                        child: Text(
                          "View",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: getProportionateScreenHeight(15),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CurrentLocationOnMap(
                                      latitude:
                                          bookRequestNotification.latitude,
                                      longitude:
                                          bookRequestNotification.longitude,
                                    )),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Accept request?'),
                                content: const Text(
                                    'This will Accept book request for your book.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      requestService.updateBookRequest(
                                          bookRequestId, "Accepted");
                                      Navigator.pop(context, 'Accepted');
                                    },
                                    child: const Text('Accept'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.check_circle_sharp,
                                size: getProportionateScreenHeight(27),
                                color: kSuccessButtonColor,
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(5),
                              ),
                              Text(
                                "Accept",
                                style: TextStyle(
                                  color: kSuccessButtonColor,
                                  fontSize: getProportionateScreenHeight(16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(15),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Reject request?'),
                                content: const Text(
                                    'This will reject book request for your book.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      requestService.updateBookRequest(
                                          bookRequestId, "Rejected");
                                      Navigator.pop(context, 'Rejected');
                                    },
                                    child: const Text('Reject'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.cancel,
                                color: Colors.red,
                                size: getProportionateScreenHeight(27),
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(5),
                              ),
                              Text(
                                "Reject",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: getProportionateScreenHeight(16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          return Container();
        });
  }
}
