import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:freebookshare/Components/CircularLoader.dart';
import 'package:freebookshare/Product/BookUploadFromInternet/Components/BookInfoCard.dart';
import 'package:http/http.dart' as http;

import '../../Constants.dart';
import 'Components/BookJsonDataModel.dart';

class BookLoaderFromInternet extends StatefulWidget {
  static String id = "BookFromInternet";

  const BookLoaderFromInternet({Key key}) : super(key: key);

  @override
  _BookLoaderFromInternetState createState() => _BookLoaderFromInternetState();
}

class _BookLoaderFromInternetState extends State<BookLoaderFromInternet> {
  String _scanBarcode;
  bool _isProgress = false;

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

  Future<List<BookData>> getData() async {
    String isbn = _scanBarcode;

    String apiKey = "AIzaSyAglxji_W2zJn6hV7IxGXwXxsUeapC4Xto";
    String url =
        "https://books.googleapis.com/books/v1/volumes?q=isbn:$isbn&maxResults=10&key=$apiKey";

    try {
      final response = await http
          .get(Uri.parse(url), headers: {"Content-Type": "application/json"});

      var jsonBody = jsonDecode(response.body);

      BookInfoFromInternet b1 = BookInfoFromInternet.fromJson(jsonBody);

      return b1.data;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    setState(() {
      _isProgress = true;
    });
    scanBarcodeNormal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Books"),
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          FutureBuilder<List<BookData>>(
              future: getData(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<BookData>> snapshot) {
                if (snapshot.hasData) {
                  BookData bookData = snapshot.data[0];
                  String isbn =
                      bookData.volume.industryIdentifiers[0].identifier;
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) => BookInfoCard(
                            bookData: snapshot.data[index],
                          ));
                } else {
                  _isProgress = false;
                  return Center(
                      child: Container(
                    child: Text("No Data Found!"),
                  ));
                }
              }),
          (_isProgress) ? CircularLoading() : Center()
        ],
      )),
    );
  }
}
