import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Constants.dart';
import '../../../../SizeConfig.dart';

class ProfileUpdateButton extends StatelessWidget {
  ProfileUpdateButton({this.getImage});
  final Function getImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF00ce00),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        iconSize: getProportionateScreenHeight(30),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: getProportionateScreenHeight(220),
                color: Color(0xFF737373),
                child: Container(
                  decoration: new BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(25.0),
                          topRight: const Radius.circular(25.0))),
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenHeight(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Profile Photo',
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(25),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: getProportionateScreenWidth(180),
                        margin: EdgeInsets.only(
                            left: getProportionateScreenWidth(20)),
                        //color: Colors.blue,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: getProportionateScreenHeight(70),
                                  width: getProportionateScreenWidth(70),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF0D47A1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    iconSize: getProportionateScreenHeight(40),
                                    onPressed: () {
                                      getImage(ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.camera_alt,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(10)),
                                Text("Camera",
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenHeight(20))),
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                Container(
                                  height: getProportionateScreenHeight(70),
                                  width: getProportionateScreenWidth(70),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFe10062),
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    iconSize: getProportionateScreenHeight(40),
                                    onPressed: () {
                                      getImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.image_rounded,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(10)),
                                Text(
                                  "Gallery",
                                  style: TextStyle(
                                      fontSize:
                                          getProportionateScreenHeight(20)),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        icon: Icon(
          Icons.camera_alt,
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
