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
        height: getProportionateScreenHeight(100),
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned(
              right: -40.0,
              top: -40.0,
              child: InkResponse(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: CircleAvatar(
                  child: Icon(Icons.close),
                  backgroundColor: Colors.red,
                ),
              ),
            ),
            Positioned(
              left: -10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextButton.icon(
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
                      size: getProportionateScreenHeight(25),
                    ),
                    label: Text(
                      "Scan Book Barcode and Upload.",
                      style: TextStyle(
                        fontSize: getProportionateScreenHeight(15),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      primary: kPrimaryButtonColor,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AddBookForm.id);
                    },
                    icon: Icon(
                      Icons.book,
                      size: getProportionateScreenHeight(25),
                    ),
                    label: Text(
                      "Upload Book Manually",
                      style: TextStyle(
                        fontSize: getProportionateScreenHeight(15),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
