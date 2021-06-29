import 'package:flutter/material.dart';
import 'package:freebookshare/Components/PopUpMenuRightCorner.dart';
import 'package:freebookshare/Request/Components/MyRequestForBookCard.dart';

import '../../Constants.dart';

class MyRequestForBook extends StatelessWidget {
  static String id = "My_Request_For_Book";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(),
      body: SafeArea(
        child: Column(
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
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: bookimgList.length,
                    itemBuilder: (context, index) => MyRequestForBookCard(
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
