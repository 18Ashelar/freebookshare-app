import 'package:flutter/material.dart';

import '../../SizeConfig.dart';

class StartUpImage extends StatelessWidget {
  const StartUpImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(250),
      width: getProportionateScreenHeight(370),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/fbsLogo.png"),
        ),
      ),
    );
  }
}
