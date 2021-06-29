import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/Product/Screens/ProductDetails.dart';

import '../../Constants.dart';
import '../../SizeConfig.dart';

class MyBookRequestCard extends StatelessWidget {
  MyBookRequestCard({this.imgPath});

  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(190),
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15),
          vertical: getProportionateScreenHeight(15)),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, ProductDetails.id);
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              // height: getProportionateScreenHeight(600),
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [kDefaultShadow], color: Colors.white),
            ),
            Positioned(
                bottom: getProportionateScreenHeight(10),
                left: getProportionateScreenWidth(10),
                child: Container(
                  height: getProportionateScreenHeight(170),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(imgPath),
                    ),
                  ),
                )),
            YourBookRequestData()
          ],
        ),
      ),
    );
  }
}

class YourBookRequestData extends StatelessWidget {
  const YourBookRequestData({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      margin: EdgeInsets.only(
          left: getProportionateScreenWidth(140),
          right: getProportionateScreenWidth(5),
          bottom: getProportionateScreenHeight(5)),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: getProportionateScreenHeight(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Created At: ",
                  style: TextStyle(fontSize: getProportionateScreenHeight(18)),
                ),
                Text(
                  "10/06/2020",
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(15),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Title: ",
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(18),
                ),
              ),
              Flexible(
                child: Text(
                  "Head First Java This is Very good Book and You Should buy ",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(15),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Location: ",
                  style: TextStyle(fontSize: getProportionateScreenHeight(18))),
              Flexible(
                child: Text(
                  "Mumbai ",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(15),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          SizedBox(
            child: Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle_sharp,
                      size: getProportionateScreenHeight(27),
                      color: kSuccessButtonColor,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(5),
                    ),
                    Text(
                      "Accept",
                      style: TextStyle(
                        color: kSuccessButtonColor,
                        fontSize: getProportionateScreenHeight(16),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: getProportionateScreenWidth(15),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.cancel,
                      color: Colors.red,
                      size: getProportionateScreenHeight(27),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(5),
                    ),
                    Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: getProportionateScreenHeight(16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
