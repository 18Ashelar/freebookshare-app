import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freebookshare/Components/RoundedButton.dart';
import 'package:freebookshare/Login%20and%20Registration/Components/LoginInputFormField.dart';
import 'package:freebookshare/SizeConfig.dart';

import '../../Constants.dart';
import '../../Widgets/DropDown.dart';

class AddBookFormSecond extends StatefulWidget {
  static String id = "Add_Book_Form_Second_Page";

  @override
  _AddBookFormSecondState createState() => _AddBookFormSecondState();
}

class _AddBookFormSecondState extends State<AddBookFormSecond> {
  String _myActivity;

  final _bookUploadSecondFormKey = GlobalKey<FormState>();

  TextEditingController _published = TextEditingController();
  TextEditingController _publisher = TextEditingController();
  TextEditingController _author = TextEditingController();
  TextEditingController _pageCount = TextEditingController();
  TextEditingController _bookDescription = TextEditingController();

  @protected
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _bookUploadSecondFormKey,
              child: Column(
                children: [
                  InputTextField(
                      controller: _published,
                      obscureText: false,
                      textAlign: TextAlign.start,
                      textInputType: TextInputType.datetime,
                      hintText: 'Published'),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  InputTextField(
                    controller: _publisher,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    textInputType: TextInputType.name,
                    hintText: 'Publisher',
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  InputTextField(
                      controller: _author,
                      textInputType: TextInputType.name,
                      obscureText: false,
                      textAlign: TextAlign.start,
                      hintText: 'Author'),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  InputTextField(
                    controller: _pageCount,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    textInputType: TextInputType.number,
                    hintText: 'Page count',
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
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
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  TextField(
                    controller: _bookDescription,
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter book description',
                        hintStyle: TextStyle(
                          fontSize: getProportionateScreenHeight(18),
                        )),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  Container(
                      height: getProportionateScreenHeight(60),
                      width: double.infinity,
                      child: RoundedButton(
                        label: "Upload",
                        btnColor: kPrimaryButtonColor,
                        textColor: Colors.white,
                        press: () {},
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
