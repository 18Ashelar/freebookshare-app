import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../Constants.dart';
import '../../SizeConfig.dart';

class ShimmerEffectForBookCard extends StatelessWidget {
  const ShimmerEffectForBookCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                enabled: true,
                child: Container(
                  height: getProportionateScreenHeight(170),
                  width: getProportionateScreenWidth(120),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.grey[400],
                  ),
                )),
          ),
          Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              enabled: true,
              child: Container(
                //color: Colors.blue,
                margin: EdgeInsets.only(
                    left: getProportionateScreenWidth(140),
                    right: getProportionateScreenWidth(10),
                    bottom: getProportionateScreenHeight(5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.grey[400],
                      width: double.infinity,
                      height: getProportionateScreenHeight(15),
                    ),
                    Container(
                      color: Colors.grey[400],
                      width: double.infinity,
                      height: getProportionateScreenHeight(15),
                    ),
                    Container(
                      color: Colors.grey[400],
                      width: getProportionateScreenWidth(150),
                      height: getProportionateScreenHeight(15),
                    ),
                    Container(
                      color: Colors.grey[400],
                      width: getProportionateScreenWidth(130),
                      height: getProportionateScreenHeight(15),
                    ),
                    Container(
                      color: Colors.grey[400],
                      width: getProportionateScreenWidth(100),
                      height: getProportionateScreenHeight(15),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
