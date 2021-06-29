import 'package:flutter/material.dart';

import '../Constants.dart';

class CircularLoading extends StatelessWidget {
  const CircularLoading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white.withOpacity(0.5),
      child: Center(
        child: CircularProgressIndicator(
          color: kPrimaryColor,
          strokeWidth: 5,
        ),
      ),
    );
  }
}
