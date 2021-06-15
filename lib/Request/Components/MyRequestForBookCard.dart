import 'package:flutter/material.dart';

import '../../Constants.dart';
import '../../SizeConfig.dart';

class MyRequestForBookCard extends StatelessWidget {
  MyRequestForBookCard({this.imgPath});

  String imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(190),
      margin: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      child: Stack(
       clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            // height: getProportionateScreenHeight(300),
            width: double.infinity,
            decoration: BoxDecoration(
                boxShadow: [kDefaultShadow],
                color: Colors.white),
          ),
          Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                height: getProportionateScreenHeight(170),
                width: getProportionateScreenWidth(130),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(imgPath),
                  ),
                ),
              )),
          Positioned(
            right:getProportionateScreenWidth(10),
            bottom: getProportionateScreenWidth(10),
            child:Container(
            child: Row(
              children: [
                Text("Created At: ",style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
            )),
                Text("10/06/2020"),
              ],
            ),
          ),),
          Positioned(
            left: 160,
            top: 20,
            child:Container(
              child: Row(
                children: [
                  Text("Status: ",style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),),
                  Text("Pending"),
                ],
              ),
            ),),

          //Close Button
          Positioned(
            top: -15,
            right: -15,

            child: IconButton(
              onPressed: () {
              },
              icon:CircleAvatar(
                radius: 30,
                child: Icon(Icons.close),
                backgroundColor: Colors.red,

              ),
            ),
          ),
        ],
      ),
    );
  }
}
