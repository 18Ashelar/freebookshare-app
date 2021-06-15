import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/Screens/AddBookRequest.dart';

import '../../Constants.dart';
import '../../SizeConfig.dart';
import 'IconButtonTop.dart';



class TopNavigationBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(300),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TopIconButton(
              press: () {},
              tooltip: "Chat with User",
              icon: Icon(
                Icons.chat,
                color: SecondaryColor,
              ),
              title: "Chat"),
          Spacer(),

          TopIconButton(
              press: () {
                Navigator.pushNamed(context, AddBookRequest.id);
              },
              tooltip: "Add Book Request",
              icon: Icon(
                Icons.book_outlined,
                color: SecondaryColor,
              ),
              title: "Add Request"),
          Spacer(),

          TopIconButton(
              press: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Stack(
                          clipBehavior: Clip.none,
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
                                TextField(
                                  keyboardType: TextInputType.name,
                                  onChanged: (value) {
                                    // email = value;
                                  },
                                  decoration:
                                  kTextFieldDecoration.copyWith(hintText: 'Search Book Name',
                                  ),
                                ),
                                SizedBox(height: getProportionateScreenHeight(20),),
                                SizedBox(
                                 width:getProportionateScreenWidth(200),
                                  height:getProportionateScreenHeight(50),
                                  child: TextButton(
                                    child: Text("Search"),
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                        textStyle: TextStyle(fontSize: 20.0),
                                        backgroundColor:kPrimaryButtonColor,
                                        primary: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    });
              },
              tooltip: "Add Book",
              icon: Icon(
                Icons.add_circle_rounded,
                color: SecondaryColor,
              ),
              title: "Add Book"),


        ],
      ),
    );
  }
}
