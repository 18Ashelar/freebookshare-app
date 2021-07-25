import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../SizeConfig.dart';

class LatestBookShimmerEffect extends StatelessWidget {
  const LatestBookShimmerEffect({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      height: getProportionateScreenHeight(210),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[400],
              highlightColor: Colors.grey[100],
              enabled: true,
              child: Padding(
                padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(20),
                    top: getProportionateScreenHeight(10)),
                child: Container(
                  color: Colors.grey[300],
                  height: getProportionateScreenHeight(210),
                  width: getProportionateScreenWidth(150),
                ),
              ),
            );
          }),
    );
  }
}
