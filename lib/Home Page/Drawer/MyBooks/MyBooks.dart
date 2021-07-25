import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:freebookshare/FirebaseServices/BookFirebaseService.dart';
import 'package:freebookshare/Getters%20And%20Setters/BookInfo.dart';
import 'package:freebookshare/Home%20Page/Drawer/MyBooks/MyBookCard.dart';
import 'package:freebookshare/Product/Components/SearchBar.dart';

import '../../../Constants.dart';
import 'MyBookShimmerEffect.dart';

class MyBooks extends StatelessWidget {
  static String id = "MyBooks_Screen";
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
        child: Column(
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
                        list = snapshot.data.docs.map((e) => e.data()).toList();
                        bookId = snapshot.data.docs.map((e) => e.id).toList();
                        return StaggeredGridView.countBuilder(
                          crossAxisCount: 2,
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) =>
                              MyBookCard(
                            bookInfo: list[index],
                            bookId: bookId[index],
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
      ),
    );
  }
}
