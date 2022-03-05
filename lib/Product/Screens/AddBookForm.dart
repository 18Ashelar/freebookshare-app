import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freebookshare/Components/CircularLoader.dart';
import 'package:freebookshare/Components/CustomSnackbar.dart';
import 'package:freebookshare/Components/RoundedButton.dart';
import 'package:freebookshare/FirebaseServices/BookFirebaseService.dart';
import 'package:freebookshare/Getters%20And%20Setters/BookDetailsAndBookId.dart';
import 'package:freebookshare/Getters%20And%20Setters/BookInfo.dart';
import 'package:freebookshare/Getters%20And%20Setters/BookInfoFromInternetWithLanguage.dart';
import 'package:freebookshare/Getters%20And%20Setters/SecondBookFormData.dart';
import 'package:freebookshare/Login%20and%20Registration/Components/LoginInputFormField.dart';
import 'package:freebookshare/Product/Components/BookFormValidator.dart';
import 'package:freebookshare/SizeConfig.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../Constants.dart';
import 'AddBookFormSecondPage.dart';

class AddBookForm extends StatefulWidget {
  static String id = "Add_Book_Form_Screen";

  BookDetailsAndBookId bookInfoAndBookId;
  AddBookForm({this.bookInfoAndBookId});

  BookInfoFromInternetWithLanguage bookInfoWithLanguage;
  AddBookForm.onlineBookData({this.bookInfoWithLanguage});

  @override
  _AddBookFormState createState() => _AddBookFormState();
}

class _AddBookFormState extends State<AddBookForm> {
  bool _isProgress = false;
  File bookImage;
  final ImagePicker _picker = ImagePicker();
  String _selectedCategory;
  BookFirebaseService bookService = BookFirebaseService();

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
  String bookImgPath;
  BookInfo bookInfo;

  @override
  void initState() {
    setUserBookData();
    super.initState();
  }

  void setUserBookData() {
    if (widget.bookInfoAndBookId != null) {
      setState(() {
        bookInfo = widget.bookInfoAndBookId.info;
        bookImgPath = widget.bookInfoAndBookId.info.imgPath;
        _bookName.text = widget.bookInfoAndBookId.info.bookName;
        _isbnNo.text = widget.bookInfoAndBookId.info.isbnNumber;
        _selectedCategory = widget.bookInfoAndBookId.info.bookCategory;
      });
    } else if (widget.bookInfoWithLanguage != null) {
      setState(() {
        bookImgPath = widget.bookInfoWithLanguage.bookData.volume.imageLinks
                    .thumbnail !=
                null
            ? widget.bookInfoWithLanguage.bookData.volume.imageLinks.thumbnail
            : widget
                .bookInfoWithLanguage.bookData.volume.imageLinks.smallThumbnail;
        _bookName.text = widget.bookInfoWithLanguage.bookData.volume.title;
        _isbnNo.text = widget.bookInfoWithLanguage.bookData.volume
                    .industryIdentifiers[0].identifier !=
                null
            ? widget.bookInfoWithLanguage.bookData.volume.industryIdentifiers[0]
                .identifier
            : widget.bookInfoWithLanguage.bookData.volume.industryIdentifiers[1]
                .identifier;
        _selectedCategory =
            widget.bookInfoWithLanguage.bookData.volume.categories[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(children: [
            //Back Button
            Positioned(
                left: getProportionateScreenWidth(0),
                top: getProportionateScreenHeight(5),
                child: Container(
                    child: IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                ))),
            Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(20),
                  horizontal: getProportionateScreenWidth(25)),
              child: Form(
                key: _bookUploadFormKey,
                child: Column(
                  children: [
                    bookImageWidget(),
                    SizedBox(height: getProportionateScreenHeight(25)),
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
                    SizedBox(height: getProportionateScreenHeight(25)),
                    InputTextField(
                        validator: BookFormValidator.title,
                        controller: _bookName,
                        hintText: "Enter book name",
                        textInputType: TextInputType.name,
                        textAlign: TextAlign.start,
                        obscureText: false),
                    SizedBox(height: getProportionateScreenHeight(25)),
                    InputTextField(
                      validator: BookFormValidator.isbn,
                      controller: _isbnNo,
                      textInputType: TextInputType.number,
                      hintText: 'Enter ISBN number',
                      obscureText: false,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: getProportionateScreenHeight(25)),
                    Container(
                      child: DropdownSearch<String>(
                        dropdownSearchDecoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: getProportionateScreenHeight(18),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: getProportionateScreenWidth(20)),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kPrimaryColor, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kPrimaryColor, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                        items: [
                          "Action and Adventure",
                          "Anthology",
                          "Classic",
                          "Comic and Graphic Novel",
                          "Crime and Detective",
                          "Computers",
                          "Drama",
                          "Fable",
                          "Fairy Tale",
                          "Fan-Fiction",
                          "Fantasy",
                          "Historical Fiction",
                          "Horror",
                          "Humor",
                          "Legend",
                          "Magical Realism",
                          "Mystery",
                          "Mythology",
                          "Notes",
                          "Realistic Fiction",
                          "Romance",
                          "Satire",
                          "Science Fiction(Sci-Fi)",
                          "Short Story",
                          "Suspense/Thriller",
                          "Biography/Autobiography",
                          "Essay",
                          "Memoir",
                          "Narrative Nonfiction",
                          "Periodicals",
                          "Programming"
                              "Reference Books",
                          "Self-help Book",
                          "Speech",
                          "Textbook",
                          "Poetry"
                        ],
                        maxHeight: getProportionateScreenHeight(500),
                        hint: "Select a book category",
                        searchBoxDecoration: InputDecoration(
                          hintText: "Search Category",
                        ),
                        selectedItem: _selectedCategory,
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                        showSearchBox: true,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(25)),
                    Container(
                        height: getProportionateScreenHeight(60),
                        width: double.infinity,
                        child: RoundedButton(
                          label: "Next",
                          btnColor: kPrimaryButtonColor,
                          textColor: Colors.white,
                          press: () async {
                            if (validate()) {
                              if (widget.bookInfoWithLanguage != null) {
                                Navigator.pushNamed(
                                    context, AddBookFormSecond.id,
                                    arguments:
                                        SecondFormBookData.onlineBookData(
                                      bookInfoWithLanguage:
                                          widget.bookInfoWithLanguage,
                                      title: _bookName.text,
                                      isbn: _isbnNo.text,
                                      bookImage: bookImage,
                                      category: _selectedCategory,
                                    ));
                              } else {
                                Navigator.pushNamed(
                                    context, AddBookFormSecond.id,
                                    arguments: SecondFormBookData(
                                      bookDetailsAndBookId:
                                          widget.bookInfoAndBookId,
                                      title: _bookName.text,
                                      isbn: _isbnNo.text,
                                      category: _selectedCategory,
                                      bookImage: bookImage,
                                    ));
                              }
                            }
                          },
                        ))
                  ],
                ),
              ),
            ),
            (_isProgress) ? CircularLoading() : Center()
          ]),
        ),
      ),
    );
  }

  bool validate() {
    final form = _bookUploadFormKey.currentState;
    if (form.validate()) {
      if (bookImage != null || bookImgPath != null) {
        form.save();
        return true;
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(CustomSnackbar.bookPhotoValidateSnackbar);
        return false;
      }
    } else {
      if (bookImage == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(CustomSnackbar.bookPhotoValidateSnackbar);
        return false;
      }
      return false;
    }
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
      if (bookImgPath != null) {
        return CachedNetworkImage(
          imageUrl: bookImgPath,
          imageBuilder: (context, imageProvider) => Hero(
            tag: 'logo',
            child: Container(
              width: getProportionateScreenWidth(190),
              height: getProportionateScreenHeight(270),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image:
                      DecorationImage(fit: BoxFit.fill, image: imageProvider)),
            ),
          ),
          placeholder: (context, url) => Container(
            width: getProportionateScreenWidth(190),
            height: getProportionateScreenHeight(270),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey[300],
            ),
          ),
          errorWidget: (context, url, error) {
            return Container(
              width: getProportionateScreenWidth(190),
              height: getProportionateScreenHeight(270),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFcac5ce),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image_rounded,
                    color: Color(0xFF737373),
                    size: getProportionateScreenHeight(45),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Text(
                    "Book Image",
                    style: TextStyle(
                      color: Color(0xFF737373),
                      fontSize: getProportionateScreenHeight(20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Text(
                    "Not Found",
                    style: TextStyle(
                      color: Color(0xFF737373),
                      fontSize: getProportionateScreenHeight(20),
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            );
          },
        );
      }
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
