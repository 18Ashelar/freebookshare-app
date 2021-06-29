import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Test1.dart';


class TestLayout extends StatefulWidget {
  static String id = "Test_Layout";

  @override
  _TestLayoutState createState() => _TestLayoutState();
}

class _TestLayoutState extends State<TestLayout> {
  Future<void> getData() async {
    String ApiKey = "AIzaSyDTtGb1GyImFWE3cYmqUThL14237bNfThM";
    String url="https://books.googleapis.com/books/v1/volumes?q=flowers+inauthor:keyes&key=$ApiKey";

    final response = await http.get(Uri.parse(url),
        headers: {"Content-Type": "application/json"});

    var jsonBody = jsonDecode(response.body);

    book b1=book.fromJson(jsonBody);

    print(response.statusCode);
    print(b1.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () async {
                await getData();
              },
              child: Text("Submit")),
        ],
      ),
    );
  }
}
