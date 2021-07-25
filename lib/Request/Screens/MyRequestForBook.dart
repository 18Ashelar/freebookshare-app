import 'package:flutter/material.dart';
import 'package:freebookshare/Request/Components/MyRequestForBookCard.dart';

import '../../Constants.dart';

class MyRequestForBook extends StatelessWidget {
  static String id = "My_Request_For_Book";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
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
}
