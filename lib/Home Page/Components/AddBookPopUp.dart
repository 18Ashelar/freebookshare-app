import 'package:flutter/material.dart';
import 'package:freebookshare/Getters%20And%20Setters/BarcodeScreenArgument.dart';
import 'package:freebookshare/Product/Screens/AddBookForm.dart';
import 'package:freebookshare/TestFile/BarcodeScanner.dart';

import '../../Constants.dart';
import '../../SizeConfig.dart';

class AddBookPopUp extends StatelessWidget {
  AddBookPopUp({this.barcodeOpener, this.barcodeContend});

  Function barcodeOpener;
  String barcodeContend;

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
                      barcodeOpener();
                      print(barcodeContend);
                      Navigator.pushNamed(context, BarcodeScanner.id,
                          arguments: BarcodeScreenArguments(barcodeContend));
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

                  // TextField(
                  //   keyboardType: TextInputType.name,
                  //   onChanged: (value) {
                  //     // email = value;
                  //   },
                  //   decoration:
                  //   kTextFieldDecoration.copyWith(hintText: 'Search Book Name',
                  //   ),
                  // ),
                  // SizedBox(height: getProportionateScreenHeight(20),),
                  // SizedBox(
                  //  width:getProportionateScreenWidth(200),
                  //   height:getProportionateScreenHeight(50),
                  //   child: TextButton(
                  //     child: Text("Search"),
                  //     onPressed: () {},
                  //     style: TextButton.styleFrom(
                  //         textStyle: TextStyle(fontSize: 20.0),
                  //         backgroundColor:kPrimaryButtonColor,
                  //         primary: Colors.white,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(20),
                  //         )),
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
