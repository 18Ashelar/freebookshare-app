import 'package:flutter/material.dart';
import 'package:freebookshare/Getters%20And%20Setters/BarcodeScreenArgument.dart';

class BarcodeScanner extends StatefulWidget {
  static String id = "Barcode_Scanner";

  final BarcodeScreenArguments arguments;

  BarcodeScanner(this.arguments);

  @override
  _BarcodeScannerState createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Barcode scan')),
            body: Builder(builder: (BuildContext context) {
              return Container(
                  alignment: Alignment.center,
                  child: Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(widget.arguments.isbn),
                      ]));
            })));
  }
}
