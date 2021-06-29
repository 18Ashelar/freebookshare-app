import 'package:flutter/material.dart';
import 'package:freebookshare/Product/Screens/ProductDetails.dart';

import '../../Constants.dart';
import '../../SizeConfig.dart';

class ProductInfoCard extends StatelessWidget {
  ProductInfoCard({this.imgPath});

  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetails.id);
      },
      child: Container(
        height: getProportionateScreenHeight(190),
        margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenHeight(15)),
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
                bottom: getProportionateScreenHeight(10),
                left: getProportionateScreenWidth(10),
                child: Container(
                  height: getProportionateScreenHeight(170),
                  width: getProportionateScreenWidth(120),
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
              //color: Colors.blue,
              margin: EdgeInsets.only(
                  left: getProportionateScreenWidth(140),
                  right: getProportionateScreenWidth(10),
                  bottom: getProportionateScreenHeight(5)),
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
                          fontSize: getProportionateScreenHeight(20),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          "Head First Java Book is very beautiful and the best jjjj",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(17),
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
                          fontSize: getProportionateScreenHeight(20),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          "Marathi",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(17),
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
                          fontSize: getProportionateScreenHeight(20),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          "12345678996",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(17),
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
                          fontSize: getProportionateScreenHeight(20),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          "Mumbai",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(17),
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
                          fontSize: getProportionateScreenHeight(20),
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
