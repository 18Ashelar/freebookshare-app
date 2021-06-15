import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:freebookshare/Product/Components/ProductDetails.dart';

import '../../Constants.dart';
import '../../SizeConfig.dart';

class MyBookRequestCard extends StatelessWidget {
  MyBookRequestCard({this.imgPath});

  String imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(190),
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15), vertical: kDefaultPadding / 2),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, ProductDetails.id);
        },
        child: Stack(
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
            Container(
             //  color: Colors.green,
              margin: EdgeInsets.only(
                  left: getProportionateScreenWidth(150),
                  right: 5.0,
                  bottom: 5.0),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top:getProportionateScreenHeight(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Created At: "),
                        Text("10/06/2020"),
                      ],
                    ),

                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Title: "),
                      Flexible(
                        child: Text(
                          "Head First Java This is Very good Book and You Should buy ",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Location: "),
                      Flexible(
                        child: Text(
                          "Mumbai ",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    child: Row(
                      children: [
                        TextButton.icon(onPressed:(){},
                          style: TextButton.styleFrom(
                            primary: kSuccessButtonColor,
                          ),
                          icon: Icon(Icons.verified),
                          label:Text("Accept"),
                          ),

                        TextButton.icon(onPressed: (){},style: TextButton.styleFrom(
                          primary: Colors.red,
                        ), icon: Icon(Icons.cancel), label:Text("Cancel"),),

                      ],),
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}