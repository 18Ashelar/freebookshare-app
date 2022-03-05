import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/Components/CircularLoader.dart';
import 'package:freebookshare/FirebaseServices/BookRequestNotificationService.dart';
import 'package:freebookshare/Getters%20And%20Setters/BookRequestNotification.dart';
import 'package:freebookshare/Product/Components/ShimmerEffectForBookInfoCard.dart';
import 'package:freebookshare/Request/Components/MyRequestForBookCard.dart';

import '../../Constants.dart';

class MyRequestForBook extends StatefulWidget {
  static String id = "My_Request_For_Book";

  @override
  _MyRequestForBookState createState() => _MyRequestForBookState();
}

class _MyRequestForBookState extends State<MyRequestForBook> {
  bool _isProgress = false;

  BookRequestService bookRequestService = BookRequestService();

  List<BookRequestNotification> requestInfo = [];
  List<String> bookRequestId = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                //  SearchBar(),
                Expanded(
                    child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 70.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        color: kBackgroundColor,
                      ),
                    ),
                    StreamBuilder<QuerySnapshot<BookRequestNotification>>(
                        stream: bookRequestService.allMyBookRequest(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                                child: Container(child: Text("No Request")));
                          }
                          if (snapshot.hasData) {
                            requestInfo = snapshot.data.docs
                                .map((e) => e.data())
                                .toList();
                            bookRequestId =
                                snapshot.data.docs.map((e) => e.id).toList();
                            if (requestInfo.length == 0) {
                              return Center(
                                  child: Container(
                                child: Text("No Request Found"),
                              ));
                            } else {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: requestInfo.length,
                                  itemBuilder: (context, index) =>
                                      MyRequestForBookCard(
                                        myRequestNotification:
                                            requestInfo[index],
                                        bookRequestId: bookRequestId[index],
                                        bookRequestDelete: deleteBookRequest,
                                      ));
                            }
                          }
                          return ListView.builder(
                              itemCount: requestInfo.length,
                              itemBuilder: (context, index) =>
                                  ShimmerEffectForBookCard());
                        })
                  ],
                ))
              ],
            ),
            (_isProgress) ? CircularLoading() : Center()
          ],
        ),
      ),
    );
  }

  Future deleteBookRequest(BuildContext context, String requestId) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          'Delete request?',
          style: TextStyle(),
        ),
        content: const Text('Are you sure want to delete this book request?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.red,
            ),
            onPressed: () async {
              Navigator.of(context).pop();
              setState(() {
                _isProgress = true;
              });
              await bookRequestService.deleteRequest(requestId).then((value) {
                setState(() {
                  _isProgress = false;
                });
              }).onError((error, stackTrace) {
                setState(() {
                  _isProgress = false;
                });
              });
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
