import 'package:flutter/material.dart';
import 'package:freebookshare/Components/PopUpMenuRightCorner.dart';
import 'package:freebookshare/Constants.dart';
import 'package:freebookshare/Product/Components/ProductInfoCard.dart';
import 'package:freebookshare/Product/Components/SearchBar.dart';

class AllAvailableBooks extends StatelessWidget {
  static String id = "All_Available_Books";
  const AllAvailableBooks({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(),
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
                ListView.builder(
                    itemCount: bookimgList.length,
                    itemBuilder: (context, index) => ProductInfoCard(
                          imgPath: bookimgList[index],
                        ))
              ],
            ))
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text("Free Book Share"),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: PopMenuBtnRightCorner(icon: Icon(Icons.more_vert)),
        ),
      ],
    );
  }
}