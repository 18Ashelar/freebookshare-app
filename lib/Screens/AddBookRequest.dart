import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/Home%20Page/Components/LatestBookShimmerEffect.dart';

class AddBookRequest extends StatefulWidget {
  static String id = "Add_book_request";

  @override
  _AddBookRequestState createState() => _AddBookRequestState();
}

class _AddBookRequestState extends State<AddBookRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DropdownSearch Demo")),
      body: SafeArea(
        child: LatestBookShimmerEffect(),
      ),
    );
  }
}
