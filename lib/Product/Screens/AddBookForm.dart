import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freebookshare/Components/CircularLoader.dart';
import 'package:freebookshare/Components/RoundedButton.dart';
import 'package:freebookshare/Login%20and%20Registration/Components/LoginInputFormField.dart';
import 'package:freebookshare/SizeConfig.dart';
import 'package:freebookshare/Widgets/DropDown.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../Constants.dart';
import 'AddBookFormSecondPage.dart';

class AddBookForm extends StatefulWidget {
  static String id = "Add_Book_Form_Screen";

  @override
  _AddBookFormState createState() => _AddBookFormState();
}

class _AddBookFormState extends State<AddBookForm> {
  bool _isProgress = false;
  File bookImage;
  final ImagePicker _picker = ImagePicker();

  //Book Image Upload
  getBookImage(ImageSource source) async {
    this.setState(() {
      _isProgress = true;
    });
    try {
      PickedFile image = await _picker.getImage(source: source);
      File imageFile = File(image.path);
      if (imageFile != null) {
        File croppedImage = await ImageCropper.cropImage(
            sourcePath: imageFile.path,
            // aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
            compressFormat: ImageCompressFormat.jpg,
            compressQuality: 70,
            androidUiSettings: AndroidUiSettings(
              toolbarColor: kPrimaryColor,
              toolbarWidgetColor: Colors.white,
            ));

        setState(() {
          bookImage = croppedImage;
          _isProgress = false;
        });
      } else {
        setState(() {
          _isProgress = false;
        });
      }
    } catch (e) {
      setState(() {
        _isProgress = false;
      });
    }
  }

  final _bookUploadFormKey = GlobalKey<FormState>();
  TextEditingController _bookName = TextEditingController();
  TextEditingController _isbnNo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String _myActivity;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(20),
                horizontal: getProportionateScreenWidth(25)),
            child: Form(
              key: _bookUploadFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  bookImageWidget(),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: getProportionateScreenHeight(45),
                          child: RoundedButton(
                            label: "Image Upload",
                            btnColor: kPrimaryButtonColor,
                            textColor: Colors.white,
                            press: () {
                              getBookImage(ImageSource.gallery);
                            },
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          icon: const Icon(Icons.camera_alt),
                          tooltip: 'Capture And Upload.',
                          iconSize: getProportionateScreenHeight(45),
                          color: kPrimaryButtonColor,
                          onPressed: () {
                            getBookImage(ImageSource.camera);
                          },
                        ),
                      ],
                    ),
                  ),
                  InputTextField(
                      controller: _bookName,
                      hintText: "Enter book name",
                      textInputType: TextInputType.name,
                      textAlign: TextAlign.start,
                      obscureText: false),
                  InputTextField(
                    controller: _isbnNo,
                    textInputType: TextInputType.number,
                    hintText: 'Enter ISBN number',
                    obscureText: false,
                    textAlign: TextAlign.start,
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
                      height: getProportionateScreenHeight(60),
                      width: double.infinity,
                      child: RoundedButton(
                        label: "Next",
                        btnColor: kPrimaryButtonColor,
                        textColor: Colors.white,
                        press: () {
                          Navigator.pushNamed(context, AddBookFormSecond.id);
                        },
                      ))
                ],
              ),
            ),
          ),
          (_isProgress) ? CircularLoading() : Center()
        ]),
      ),
    );
  }

  Widget bookImageWidget() {
    if (bookImage != null) {
      return Flexible(
        child: Hero(
          tag: 'logo',
          child: Container(
            width: getProportionateScreenWidth(190),
            height: getProportionateScreenHeight(270),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                    fit: BoxFit.fill, image: FileImage(bookImage))),
          ),
        ),
      );
    } else {
      return Flexible(
        child: Hero(
          tag: 'logo',
          child: Container(
            width: getProportionateScreenWidth(200),
            height: getProportionateScreenHeight(280),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [kDefaultShadow],
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/samplePhoto.jpg"))),
          ),
        ),
      );
    }
  }
}
