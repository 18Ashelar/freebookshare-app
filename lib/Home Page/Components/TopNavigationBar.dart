import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:freebookshare/Screens/AddBookRequest.dart';
import 'package:freebookshare/TestFile/BarcodeScanner.dart';

import 'AddBookPopUp.dart';
import 'IconButtonTop.dart';

class TopNavigationBar extends StatefulWidget {
  @override
  _TopNavigationBarState createState() => _TopNavigationBarState();
}

class _TopNavigationBarState extends State<TopNavigationBar> {
  String _scanBarcode;

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue,
      // width: getProportionateScreenWidth(300),
      child: Row(
        children: [
          Expanded(
            child: TopIconButton(
                press: () {
                  Navigator.pushNamed(context, AddBookRequest.id);
                },
                tooltip: "Add Book Request",
                icon: Icons.book_outlined,
                title: "Add Request"),
          ),
          Expanded(
            child: TopIconButton(
                press: () {
                  Navigator.pushNamed(context, BarcodeScanner.id);
                },
                tooltip: "Chat with User",
                icon: Icons.chat,
                title: "Chat"),
          ),
          Expanded(
            child: TopIconButton(
                press: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AddBookPopUp(
                          barcodeOpener: scanBarcodeNormal,
                          barcodeContend: _scanBarcode,
                        );
                      });
                },
                tooltip: "Add Book",
                icon: Icons.add_circle_rounded,
                title: "Add Book"),
          ),
          //Spacer(),
          //Spacer(),
        ],
      ),
    );
  }
}
