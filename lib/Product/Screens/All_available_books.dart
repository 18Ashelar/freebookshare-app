import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/Constants.dart';
import 'package:freebookshare/Product/Components/AllBookDataType.dart';
import 'package:freebookshare/Product/Components/SearchBar.dart';
import 'package:freebookshare/SizeConfig.dart';

class AllAvailableBooks extends StatefulWidget {
  static String id = "All_Available_Books";

  @override
  _AllAvailableBooksState createState() => _AllAvailableBooksState();
}

class _AllAvailableBooksState extends State<AllAvailableBooks> {
  bool _enabled = true;

  int _selectIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  final List category = [
    'All',
    'Free',
    "Paid",
  ];

  List bookData = [
    AllBookDataType.allBookData(),
    AllBookDataType.freeBookData(),
    AllBookDataType.paidBookData()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SearchBar(),
            buildContainer(),
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
                bookData[_selectIndex],
              ],
            ))
          ],
        ),
      ),
    );
  }

  Container buildContainer() {
    return Container(
      height: getProportionateScreenHeight(40),
      margin: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(10),
      ),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: category.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _onItemTapped(index);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: index == 0
                      ? getProportionateScreenWidth(20)
                      : getProportionateScreenWidth(63),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                decoration: BoxDecoration(
                  color: index == _selectIndex
                      ? Colors.white.withOpacity(0.4)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  category[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenWidth(17),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
