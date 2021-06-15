import 'package:flutter/material.dart';
import 'package:freebookshare/Components/RoundedButton.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

import '../Constants.dart';
import '../SizeConfig.dart';

class AddBookRequest extends StatefulWidget {
  static String id = "Add_book_request";

  const AddBookRequest({Key key}) : super(key: key);

  @override
  _AddBookRequestState createState() => _AddBookRequestState();
}

class _AddBookRequestState extends State<AddBookRequest> {
  bool _isKeyboardOpen = false;

  @protected
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _isKeyboardOpen = visible;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _isKeyboardOpen
                ? Container()
                : Flexible(
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        width: double.infinity,
                        height: getProportionateScreenHeight(300),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/bookImage/6.jpg"))),
                      ),
                    ),
                  ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedButton(
                    label: "Image Upload",
                    btnColor: Colors.blue[600],
                    textColor: Colors.white,
                    press: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.camera_alt),
                    tooltip: 'Capture And Upload.',
                    iconSize: 40.0,
                    color: Colors.blue,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            TextField(
              keyboardType: TextInputType.name,
              textAlign: TextAlign.center,
              onChanged: (value) {
                // email = value;
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter book name'),
            ),
            TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              onChanged: (value) {
                // email = value;
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter Isbn number'),
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              textAlign: TextAlign.center,
              onChanged: (value) {
                // email = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter book description'),
            ),
            Container(
                height: getProportionateScreenHeight(55),
                width: double.infinity,
                child: RoundedButton(
                  label: "Upload",
                  btnColor: Colors.blue[600],
                  textColor: Colors.white,
                  press: () {},
                ))
          ],
        ),
      ),
    );
  }
}
