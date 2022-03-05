import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/Components/CustomSnackbar.dart';
import 'package:freebookshare/Components/RoundedButton.dart';
import 'package:freebookshare/FirebaseServices/BookFirebaseService.dart';
import 'package:freebookshare/Getters%20And%20Setters/BookRequestNotification.dart';
import 'package:freebookshare/Product/Components/ShimmerEffectForBookInfoCard.dart';
import 'package:intl/intl.dart';

import '../../Constants.dart';
import '../../SizeConfig.dart';

class MyRequestForBookCard extends StatelessWidget {
  MyRequestForBookCard(
      {this.myRequestNotification, this.bookRequestId, this.bookRequestDelete});

  final BookRequestNotification myRequestNotification;
  final bookRequestDelete;
  final String bookRequestId;
  BookFirebaseService service = BookFirebaseService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future:
            BookFirebaseService.users.doc(myRequestNotification.bookId).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic> data =
                snapshot.data.data() as Map<String, dynamic>;
            if (data == null) {
              return Container(
                height: getProportionateScreenHeight(190),
                margin: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      // height: getProportionateScreenHeight(300),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          boxShadow: [kDefaultShadow], color: Colors.white),
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
                                press: () =>
                                    bookRequestDelete(context, bookRequestId),
                              )),
                        ],
                      )),
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                height: getProportionateScreenHeight(190),
                margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenHeight(10)),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      // height: getProportionateScreenHeight(300),
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
                          height: getProportionateScreenHeight(170),
                          width: getProportionateScreenWidth(130),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: imageProvider,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) {
                          return Container(
                            height: getProportionateScreenHeight(170),
                            width: getProportionateScreenWidth(130),
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

                    Positioned(
                      left: getProportionateScreenWidth(150),
                      top: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Text("Created At: ",
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(14),
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  DateFormat.yMMMd().add_j().format(
                                      myRequestNotification.createdAt.toDate()),
                                  style: TextStyle(
                                      fontSize:
                                          getProportionateScreenWidth(12)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  "Status: ",
                                  style: TextStyle(
                                      fontSize: getProportionateScreenWidth(14),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(myRequestNotification.requestStatus,
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(12))),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Owner Details: ",
                                  style: TextStyle(
                                      fontSize: getProportionateScreenWidth(14),
                                      fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (myRequestNotification.requestStatus ==
                                        "Accepted") {
                                      showCustomDialog(context);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(CustomSnackbar
                                              .bookOwnerContactDetailsShow);
                                    }
                                  },
                                  child: Container(
                                    child: Text(
                                      "View",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                        fontSize:
                                            getProportionateScreenHeight(15),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 15,
                      child: GestureDetector(
                        onTap: () => bookRequestDelete(context, bookRequestId),
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: getProportionateScreenHeight(27),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(5),
                            ),
                            Text(
                              "Delete",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: getProportionateScreenHeight(16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //Close Button
                    // Positioned(
                    //   top: -15,
                    //   right: -15,
                    //   child: IconButton(
                    //     onPressed: () {},
                    //     icon: CircleAvatar(
                    //       radius: 30,
                    //       child: Icon(Icons.close),
                    //       backgroundColor: Colors.red,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              );
            }
          }
          return ShimmerEffectForBookCard();
        });
  }

  //Show dialog after book uploaded successfully...........
  Future showCustomDialog(BuildContext context) => showModal(
        configuration: FadeScaleTransitionConfiguration(
          barrierDismissible: true,
          transitionDuration: Duration(seconds: 1),
        ),
        context: context,
        builder: (BuildContext context) => FutureBuilder<DocumentSnapshot>(
            future: BookFirebaseService.usersData
                .doc(myRequestNotification.requestSenderUserId)
                .get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Error");
              }
              if (snapshot.hasData) {
                Map<String, dynamic> userData =
                    snapshot.data.data() as Map<String, dynamic>;
                Map<String, dynamic> contact =
                    userData["contact"] as Map<String, dynamic>;
                return AlertDialog(
                  elevation: 25,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  title: Container(
                    padding:
                        EdgeInsets.only(top: getProportionateScreenWidth(10)),
                    decoration: BoxDecoration(
                      //   color: Colors.red,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                    child: Center(
                        child: Text("Contact Info",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: getProportionateScreenHeight(25)))),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  content: Container(
                    height: getProportionateScreenHeight(150),
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(10)),
                    decoration: BoxDecoration(
                      //  color: Colors.red,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Name:",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(17),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              " " +
                                  userData["firstname"] +
                                  " " +
                                  userData["lastname"],
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(14),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Phone no:",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(17),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              " " + contact["phone_no"],
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(14),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "City:",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(17),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              " " + contact["city"],
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(14),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    Container(
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                        onPressed: () => {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(CustomSnackbar.upcomingFeature)
                        },
                        icon: Icon(
                          Icons.chat,
                          color: Colors.white,
                          size: getProportionateScreenWidth(25),
                        ),
                        label: Text(
                          'Chat',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: getProportionateScreenWidth(15)),
                        ),
                      ),
                    ),
                    Container(
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                        onPressed: () => {Navigator.of(context).pop()},
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: getProportionateScreenWidth(25),
                        ),
                        label: Text(
                          'Close',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: getProportionateScreenWidth(15)),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return Container();
            }),
      );
}
