import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/Screens/AddBookRequest.dart';
import 'package:freebookshare/TestFile/TestLayout.dart';

import 'AddBookPopUp.dart';
import 'IconButtonTop.dart';

class TopNavigationBar extends StatefulWidget {
  @override
  _TopNavigationBarState createState() => _TopNavigationBarState();
}

class _TopNavigationBarState extends State<TopNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue,
      // width: getProportionateScreenWidth(300),
      child: Row(
        children: [
          Expanded(
            child: TopIconButton(
                press: () {
                  Navigator.pushNamed(context, AddBookRequest.id);
                },
                tooltip: "Add Book Request",
                icon: Icons.book_outlined,
                title: "Add Request"),
          ),
          Expanded(
            child: TopIconButton(
                press: () {
                  Navigator.pushNamed(context, TestLayout.id);
                },
                tooltip: "Chat with User",
                icon: Icons.chat,
                title: "Chat"),
          ),
          Expanded(
            child: TopIconButton(
                press: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AddBookPopUp();
                      });
                },
                tooltip: "Add Book",
                icon: Icons.add_circle_rounded,
                title: "Add Book"),
          ),
          //Spacer(),
          //Spacer(),
        ],
      ),
    );
  }
}
