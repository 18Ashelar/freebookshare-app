import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:freebookshare/Components/CircularLoader.dart';
import 'package:freebookshare/FirebaseServices/BookFirebaseService.dart';
import 'package:freebookshare/Getters%20And%20Setters/BookInfo.dart';
import 'package:freebookshare/Home%20Page/Drawer/MyBooks/MyBookCard.dart';
import 'package:freebookshare/Product/Components/SearchBar.dart';

import '../../../Constants.dart';
import 'MyBookShimmerEffect.dart';

class MyBooks extends StatefulWidget {
  static String id = "MyBooks_Screen";

  @override
  _MyBooksState createState() => _MyBooksState();
}

class _MyBooksState extends State<MyBooks> {
  bool _isProgress = false;

  final BookFirebaseService service = BookFirebaseService();

  List<BookInfo> list = [];

  List<String> bookId = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SearchBar(),
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
                    StreamBuilder<QuerySnapshot<BookInfo>>(
                        stream: service.userBooks(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            list = snapshot.data.docs
                                .map((e) => e.data())
                                .toList();
                            bookId =
                                snapshot.data.docs.map((e) => e.id).toList();

                            if (list.length == 0) {
                              return Center(
                                child: Container(
                                  child: Text("No Book Available."),
                                ),
                              );
                            }

                            return StaggeredGridView.countBuilder(
                              crossAxisCount: 2,
                              itemCount: list.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  MyBookCard(
                                bookInfo: list[index],
                                bookId: bookId[index],
                                bookDelete: deleteUser,
                              ),
                              staggeredTileBuilder: (int index) =>
                                  StaggeredTile.fit(1),
                            );
                          } else {
                            return MyBookShimmerEffect();
                          }
                        }),
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

  Future deleteUser(BuildContext context, String bookId, String url) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Delete book?'),
        content: const Text('Are you sure want to delete this book?'),
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
              await service.deleteUserBook(bookId).then((value) {
                service.deleteUserBookImage(url);
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
