import 'package:flutter/material.dart';
import 'package:freebookshare/Product/Components/ProductDetails.dart';

import '../../Constants.dart';
import '../../SizeConfig.dart';

class ProductInfoCard extends StatelessWidget {
  ProductInfoCard({this.imgPath});

  String imgPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetails.id);
      },
      child: Container(
        height: getProportionateScreenHeight(190),
        margin: EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
        // color: Colors.deepOrangeAccent,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              // height: getProportionateScreenHeight(300),
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [kDefaultShadow],
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white),
            ),
            Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  height: getProportionateScreenHeight(170),
                  width: getProportionateScreenWidth(130),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(imgPath),
                    ),
                    color: Colors.grey[400],
                  ),
                )),
            Container(
              //  color: Colors.red,
              margin: EdgeInsets.only(
                  left: getProportionateScreenWidth(150),
                  right: 10.0,
                  bottom: 5.0),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Title: ",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          "Head First Java Book is very beautiful and the best jjjj",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Language: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          "Marathi",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "ISBN: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          "12345678996",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Location: ",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          "Mumbai",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Free to Share",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
