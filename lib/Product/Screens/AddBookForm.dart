import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freebookshare/Components/RoundedButton.dart';
import 'package:freebookshare/SizeConfig.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

import '../../Constants.dart';
import '../../Widgets/DropDown.dart';
import 'AddBookFormSecondPage.dart';

class AddBookForm extends StatefulWidget {
  static String id = "Add_Book_Form_Screen";

  @override
  _AddBookFormState createState() => _AddBookFormState();
}

class _AddBookFormState extends State<AddBookForm> {
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
    String _myActivity;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical:getProportionateScreenHeight(20), horizontal: getProportionateScreenWidth(25)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _isKeyboardOpen
                  ? Container()
                  : Flexible(
                      child: Hero(
                        tag: 'logo',
                        child: Container(
                          width: getProportionateScreenWidth(200),
                          height: getProportionateScreenHeight(250),
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
                onChanged: (value) {
                  // email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter book name'),
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  // email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter ISBN number'),
              ),
              Container(
                child: DropDownFormField(
                  hintText: 'Category',
                  value: _myActivity,
                  onChanged: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                    print(_myActivity);
                  },
                  dataSource: [
                    {
                      "display": "Running",
                      "value": "Running",
                    },
                    {
                      "display": "Climbing",
                      "value": "Climbing",
                    },
                    {
                      "display": "Walking",
                      "value": "Walking",
                    },
                    {
                      "display": "Swimming",
                      "value": "Swimming",
                    },
                    {
                      "display": "Soccer Practice",
                      "value": "Soccer Practice",
                    },
                    {
                      "display": "Baseball Practice",
                      "value": "Baseball Practice",
                    },
                    {
                      "display": "Football Practice",
                      "value": "Football Practice",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              Container(
                  height: getProportionateScreenHeight(55),
                  width: double.infinity,
                  child: RoundedButton(
                    label: "Next",
                    btnColor: Colors.blue[600],
                    textColor: Colors.white,
                    press: () {
                      Navigator.pushNamed(context, AddBookFormSecond.id);
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
