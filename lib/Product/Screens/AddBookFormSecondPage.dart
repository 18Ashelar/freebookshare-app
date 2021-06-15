import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freebookshare/Components/RoundedButton.dart';
import 'package:freebookshare/SizeConfig.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

import '../../Constants.dart';
import '../../Widgets/DropDown.dart';

class AddBookFormSecond extends StatefulWidget {
  static String id = "Add_Book_Form_Second_Page";

  @override
  _AddBookFormSecondState createState() => _AddBookFormSecondState();
}

class _AddBookFormSecondState extends State<AddBookFormSecond> {
  bool _isKeyboardOpen = false;
  String _myActivity;

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
        resizeToAvoidBottomInset:false,
      body: Container(
        margin: EdgeInsets.only(top:getProportionateScreenHeight(30)),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              TextField(
                keyboardType: TextInputType.datetime,
                onChanged: (value) {
                  // email = value;
                },
                decoration:
                kTextFieldDecoration.copyWith(hintText: 'Published'),
              ),
              SizedBox(height:getProportionateScreenHeight(40),),
              TextField(
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  // email = value;
                },
                decoration:
                kTextFieldDecoration.copyWith(hintText: 'Publisher'),
              ),
              SizedBox(height:getProportionateScreenHeight(40),),
              TextField(
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  // email = value;
                },
                decoration:
                kTextFieldDecoration.copyWith(hintText: 'Author'),
              ),
              SizedBox(height:getProportionateScreenHeight(40),),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  // email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Page count'),
              ),
              SizedBox(height:getProportionateScreenHeight(40),),
              Container(
                child: DropDownFormField(
                  hintText: 'Select Book Language',
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
              SizedBox(height:getProportionateScreenHeight(40),),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                onChanged: (value) {
                  // email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter book description'),
              ),
              SizedBox(height:getProportionateScreenHeight(40),),
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
      ),
    );
  }
}
