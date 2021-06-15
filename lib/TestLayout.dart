import 'package:flutter/material.dart';
import 'package:freebookshare/Components/RoundedButton.dart';
import 'package:freebookshare/Product/Components/SearchBar.dart';
import 'Constants.dart';
import 'Product/Components/BookInfoShow.dart';
import 'SizeConfig.dart';

class TestLayout extends StatefulWidget {

  static String id = "Test_Layout";

  @override
  _TestLayoutState createState() => _TestLayoutState();
}

class _TestLayoutState extends State<TestLayout>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: Column(
        children: [
          Center(
            child: RaisedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: kBackgroundColor,
                        content: Stack(
                          overflow: Overflow.visible,
                          children: <Widget>[
                            Positioned(
                              right: -40.0,
                              top: -40.0,
                              child: InkResponse(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: CircleAvatar(
                                  child: Icon(Icons.close),
                                  backgroundColor: Colors.red,

                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: kDefaultPadding, vertical: kDefaultPadding / 4),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Colors.grey),
                                  child: TextField(
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                        icon: Icon(
                                          Icons.search,
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: "Search Book Name",
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                                SizedBox(height: getProportionateScreenHeight(20),),
                                Container(
                                    height: getProportionateScreenHeight(55),
                                    width: double.infinity,
                                    child: RoundedButton(
                                      label: "Next",
                                      btnColor: kPrimaryButtonColor,
                                      textColor: Colors.white,
                                      press: () {},
                                    ))



                              ],
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Text("Open Popup"),
            ),
          ),





        ],
      ),
    );
  }
}
