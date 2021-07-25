import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Constants.dart';
import '../../../SizeConfig.dart';

class MyBookShimmerEffect extends StatelessWidget {
  const MyBookShimmerEffect({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[400],
        highlightColor: Colors.grey[100],
        enabled: true,
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) => Container(
            width: getProportionateScreenWidth(150),
            margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(15)),
            height: getProportionateScreenHeight(245),
            child: Stack(
              children: [
                Container(
                  height: getProportionateScreenHeight(207),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(29),
                    boxShadow: [kDefaultShadow],
                  ),
                ),
                Container(
                  height: getProportionateScreenHeight(170),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22),
                    ),
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
          staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
        ));
  }
}
