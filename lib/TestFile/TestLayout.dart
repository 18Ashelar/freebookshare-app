
import 'package:flutter/material.dart';

import '../Constants.dart';

class TestLayout extends StatefulWidget {
  static String id = "Test_Layout";

  @override
  _TestLayoutState createState() => _TestLayoutState();
}

class _TestLayoutState extends State<TestLayout> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: SafeArea(
          child: Stack(
        children: [

        ],
      )),
    );
  }


}


