import 'package:flutter/material.dart';
import 'package:freebookshare/Product/BookUploadFromInternet/BookLoaderFromGoogle.dart';
import 'package:freebookshare/Product/Screens/AddBookForm.dart';

import '../../Constants.dart';
import '../../SizeConfig.dart';

class AddBookPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: getProportionateScreenHeight(115),
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned(
              right: -40.0,
              top: -40.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: CircleAvatar(
                  radius: 20,
                  child: Icon(
                    Icons.close,
                    size: 25,
                  ),
                  backgroundColor: Colors.red,
                ),
              ),
            ),
            Positioned(
              right: getProportionateScreenWidth(-20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: getProportionateScreenHeight(60),
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          primary: kPrimaryButtonColor,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            BookLoaderFromInternet.id,
                          );
                        },
                        icon: Icon(
                          Icons.qr_code,
                          size: 25,
                        ),
                        label: Text(
                          "Scan Book Barcode and Upload.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      height: getProportionateScreenHeight(60),
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          primary: kPrimaryButtonColor,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, AddBookForm.id);
                        },
                        icon: Icon(
                          Icons.book,
                          size: 25,
                        ),
                        label: Text(
                          "Upload Book Manually",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
