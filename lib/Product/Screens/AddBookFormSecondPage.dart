import 'dart:convert';

import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:freebookshare/Components/CircularLoader.dart';
import 'package:freebookshare/Components/CustomSnackbar.dart';
import 'package:freebookshare/Components/RoundedButton.dart';
import 'package:freebookshare/Constants.dart';
import 'package:freebookshare/FirebaseServices/BookFirebaseService.dart';
import 'package:freebookshare/Getters%20And%20Setters/BookInfo.dart';
import 'package:freebookshare/Getters%20And%20Setters/LanguageModel.dart';
import 'package:freebookshare/Getters%20And%20Setters/SecondBookFormData.dart';
import 'package:freebookshare/Login%20and%20Registration/Components/LoginInputFormField.dart';
import 'package:freebookshare/SizeConfig.dart';

import '../../MainScreen.dart';

class AddBookFormSecond extends StatefulWidget {
  static String id = "Add_Book_Form_Second_Page";

  SecondFormBookData secondFormBookData;
  AddBookFormSecond({this.secondFormBookData});

  @override
  _AddBookFormSecondState createState() => _AddBookFormSecondState();
}

class _AddBookFormSecondState extends State<AddBookFormSecond> {
  String _selectedLanguage;
  String _selectLendingType;
  bool _isProgress = false;
  final _bookUploadSecondFormKey = GlobalKey<FormState>();
  BookFirebaseService bookService = BookFirebaseService();
  BookInfo book;

  TextEditingController _published = TextEditingController();
  TextEditingController _publisher = TextEditingController();
  TextEditingController _author = TextEditingController();
  TextEditingController _pageCount = TextEditingController();
  TextEditingController _bookDescription = TextEditingController();
  String bookImagePath;
  @protected
  void initState() {
    setUserBookData();
    super.initState();
  }

  void setUserBookData() {
    if (widget.secondFormBookData.bookDetailsAndBookId != null) {
      setState(() {
        bookImagePath =
            widget.secondFormBookData.bookDetailsAndBookId.info.imgPath;
        _published.text =
            widget.secondFormBookData.bookDetailsAndBookId.info.published;
        _publisher.text =
            widget.secondFormBookData.bookDetailsAndBookId.info.publisher;
        _author.text =
            widget.secondFormBookData.bookDetailsAndBookId.info.author;
        _pageCount.text =
            widget.secondFormBookData.bookDetailsAndBookId.info.pageCount;
        _bookDescription.text =
            widget.secondFormBookData.bookDetailsAndBookId.info.bookDescription;
        _selectedLanguage =
            widget.secondFormBookData.bookDetailsAndBookId.info.bookLanguage;
        _selectLendingType =
            widget.secondFormBookData.bookDetailsAndBookId.info.lendingType;
      });
    } else if (widget.secondFormBookData.bookInfoWithLanguage != null) {
      setState(() {
        bookImagePath = widget.secondFormBookData.bookInfoWithLanguage.bookData
                    .volume.imageLinks.thumbnail !=
                null
            ? widget.secondFormBookData.bookInfoWithLanguage.bookData.volume
                .imageLinks.thumbnail
            : widget.secondFormBookData.bookInfoWithLanguage.bookData.volume
                .imageLinks.smallThumbnail;

        _published.text = widget.secondFormBookData.bookInfoWithLanguage
            .bookData.volume.publishedDate;
        _publisher.text = widget
            .secondFormBookData.bookInfoWithLanguage.bookData.volume.publisher;
        _author.text = widget
            .secondFormBookData.bookInfoWithLanguage.bookData.volume.authors[0];
        _pageCount.text = widget
            .secondFormBookData.bookInfoWithLanguage.bookData.volume.pageCount
            .toString();
        _bookDescription.text = widget.secondFormBookData.bookInfoWithLanguage
            .bookData.volume.description;
        _selectedLanguage =
            widget.secondFormBookData.bookInfoWithLanguage.language;
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
                    print("af");
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                ))),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(40),
                  horizontal: getProportionateScreenWidth(25)),
              child: Form(
                key: _bookUploadSecondFormKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    InputTextField(
                        controller: _published,
                        obscureText: false,
                        textAlign: TextAlign.start,
                        textInputType: TextInputType.datetime,
                        hintText: 'Published'),
                    SizedBox(
                      height: getProportionateScreenHeight(25),
                    ),
                    InputTextField(
                      controller: _publisher,
                      obscureText: false,
                      textAlign: TextAlign.start,
                      textInputType: TextInputType.name,
                      hintText: 'Publisher',
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(25),
                    ),
                    InputTextField(
                        controller: _author,
                        textInputType: TextInputType.name,
                        obscureText: false,
                        textAlign: TextAlign.start,
                        hintText: 'Author'),
                    SizedBox(
                      height: getProportionateScreenHeight(25),
                    ),
                    InputTextField(
                      controller: _pageCount,
                      obscureText: false,
                      textAlign: TextAlign.start,
                      textInputType: TextInputType.number,
                      hintText: 'Page count',
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(25),
                    ),
                    Container(
                      child: DropdownSearch<LanguageModel>(
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
                          // LanguageModel(code: "ma", name: "Akshay"),
                        ],
                        maxHeight: getProportionateScreenHeight(500),
                        onFind: (String filter) => getData(filter),
                        hint: "Select a book language",
                        searchBoxDecoration: InputDecoration(
                          hintText: "Search Language",
                        ),
                        selectedItem:
                            (widget.secondFormBookData.bookDetailsAndBookId !=
                                        null ||
                                    widget.secondFormBookData
                                            .bookInfoWithLanguage !=
                                        null)
                                ? LanguageModel(name: _selectedLanguage)
                                : null,
                        onChanged: (LanguageModel m) {
                          setState(() {
                            _selectedLanguage = m.name;
                          });
                        },
                        showSearchBox: true,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(25),
                    ),
                    Container(
                      child: DropdownSearch<String>(
                        dropdownSearchDecoration: InputDecoration(
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
                        items: ["Free to Share", "For Sale"],
                        maxHeight: getProportionateScreenHeight(150),
                        hint: "Lending Type",
                        selectedItem: _selectLendingType,
                        onChanged: (value) {
                          setState(() {
                            _selectLendingType = value;
                          });
                        },
                        showSearchBox: false,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(25),
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
                      height: getProportionateScreenHeight(25),
                    ),
                    Container(
                        height: getProportionateScreenHeight(60),
                        width: double.infinity,
                        child: RoundedButton(
                          label: "Upload",
                          btnColor: kPrimaryButtonColor,
                          textColor: Colors.white,
                          press: () async {
                            setState(() {
                              _isProgress = true;
                            });
                            //this will update book data
                            if (widget
                                    .secondFormBookData.bookDetailsAndBookId !=
                                null) {
                              //when user want to update book Image
                              if (widget.secondFormBookData.bookImage != null) {
                                var bookUrl = await bookService.addBookImage(
                                    widget.secondFormBookData.bookImage,
                                    widget.secondFormBookData.title);
                                book = BookInfo(
                                  userId: bookService.uid(),
                                  bookName: widget.secondFormBookData.title,
                                  isbnNumber: widget.secondFormBookData.isbn,
                                  imgPath: bookUrl,
                                  published: _published.text,
                                  publisher: _publisher.text,
                                  author: _author.text,
                                  bookCategory:
                                      widget.secondFormBookData.category,
                                  pageCount: _pageCount.text,
                                  bookLanguage: _selectedLanguage,
                                  bookDescription: _bookDescription.text,
                                  createdAt: Timestamp.now(),
                                  lendingType: _selectLendingType,
                                );

                                //Update Book Data
                                await bookService.bookRef
                                    .doc(widget.secondFormBookData
                                        .bookDetailsAndBookId.bookId)
                                    .set(book)
                                    .then((value) {
                                  showCustomDialog(
                                      context, "Book updated successfully!");

                                  setState(() {
                                    _isProgress = false;
                                  });
                                }).onError((error, stackTrace) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      CustomSnackbar.errorSnackBar);
                                  setState(() {
                                    _isProgress = false;
                                  });
                                });
                              }
                              //when user don't want to update book image
                              else {
                                book = BookInfo(
                                  userId: bookService.uid(),
                                  bookName: widget.secondFormBookData.title,
                                  isbnNumber: widget.secondFormBookData.isbn,
                                  imgPath: bookImagePath,
                                  published: _published.text,
                                  publisher: _publisher.text,
                                  author: _author.text,
                                  bookCategory:
                                      widget.secondFormBookData.category,
                                  pageCount: _pageCount.text,
                                  bookLanguage: _selectedLanguage,
                                  bookDescription: _bookDescription.text,
                                  createdAt: Timestamp.now(),
                                  lendingType: _selectLendingType,
                                );

                                // Update Book Data
                                await bookService.bookRef
                                    .doc(widget.secondFormBookData
                                        .bookDetailsAndBookId.bookId)
                                    .set(book)
                                    .then((value) {
                                  showCustomDialog(
                                      context, "Book updated successfully!");

                                  setState(() {
                                    _isProgress = false;
                                  });
                                }).onError((error, stackTrace) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      CustomSnackbar.errorSnackBar);
                                  setState(() {
                                    _isProgress = false;
                                  });
                                });
                              }
                            }

                            //This will add book from internet
                            if (widget
                                    .secondFormBookData.bookInfoWithLanguage !=
                                null) {
                              //when user want to change book Image
                              if (widget.secondFormBookData.bookImage != null) {
                                var bookUrl = await bookService.addBookImage(
                                    widget.secondFormBookData.bookImage,
                                    widget.secondFormBookData.title);
                                book = BookInfo(
                                  userId: bookService.uid(),
                                  bookName: widget.secondFormBookData.title,
                                  isbnNumber: widget.secondFormBookData.isbn,
                                  imgPath: bookUrl,
                                  published: _published.text,
                                  publisher: _publisher.text,
                                  author: _author.text,
                                  bookCategory:
                                      widget.secondFormBookData.category,
                                  pageCount: _pageCount.text,
                                  bookLanguage: _selectedLanguage,
                                  bookDescription: _bookDescription.text,
                                  createdAt: Timestamp.now(),
                                  lendingType: _selectLendingType,
                                );

                                //Add Book Data from internet
                                await bookService.bookRef
                                    .add(book)
                                    .then((value) {
                                  showCustomDialog(
                                      context, "Book uploaded successfully!");

                                  setState(() {
                                    _isProgress = false;
                                  });
                                }).onError((error, stackTrace) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      CustomSnackbar.errorSnackBar);
                                  setState(() {
                                    _isProgress = false;
                                  });
                                });
                              }
                              //when user don't want to update book image
                              else {
                                book = BookInfo(
                                  userId: bookService.uid(),
                                  bookName: widget.secondFormBookData.title,
                                  isbnNumber: widget.secondFormBookData.isbn,
                                  imgPath: bookImagePath,
                                  published: _published.text,
                                  publisher: _publisher.text,
                                  author: _author.text,
                                  bookCategory:
                                      widget.secondFormBookData.category,
                                  pageCount: _pageCount.text,
                                  bookLanguage: _selectedLanguage,
                                  bookDescription: _bookDescription.text,
                                  createdAt: Timestamp.now(),
                                  lendingType: _selectLendingType,
                                );

                                // add Book Data with internet image
                                await bookService.bookRef
                                    .add(book)
                                    .then((value) {
                                  showCustomDialog(
                                      context, "Book uploaded successfully!");

                                  setState(() {
                                    _isProgress = false;
                                  });
                                }).onError((error, stackTrace) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      CustomSnackbar.errorSnackBar);
                                  setState(() {
                                    _isProgress = false;
                                  });
                                });
                              }
                            }

                            //This will add book data
                            else {
                              var bookUrl = await bookService.addBookImage(
                                  widget.secondFormBookData.bookImage,
                                  widget.secondFormBookData.title);

                              book = BookInfo(
                                userId: bookService.uid(),
                                bookName: widget.secondFormBookData.title,
                                isbnNumber: widget.secondFormBookData.isbn,
                                imgPath: bookUrl,
                                published: _published.text,
                                publisher: _publisher.text,
                                author: _author.text,
                                bookCategory:
                                    widget.secondFormBookData.category,
                                pageCount: _pageCount.text,
                                bookLanguage: _selectedLanguage,
                                bookDescription: _bookDescription.text,
                                createdAt: Timestamp.now(),
                                lendingType: _selectLendingType,
                              );

                              //add data to firebase
                              await bookService.bookRef.add(book).then((value) {
                                showCustomDialog(
                                    context, "Book uploaded successfully!");

                                setState(() {
                                  _isProgress = false;
                                });
                              }).onError((error, stackTrace) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(CustomSnackbar.errorSnackBar);
                                setState(() {
                                  _isProgress = false;
                                });
                              });
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

  //Show dialog after book uploaded successfully...........
  Future showCustomDialog(BuildContext context, String title) => showModal(
        configuration: FadeScaleTransitionConfiguration(
          barrierDismissible: false,
          transitionDuration: Duration(seconds: 1),
        ),
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: Color(0xFF515C6E),
          elevation: 25,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          title: Container(
              height: getProportionateScreenHeight(150),
              padding: EdgeInsets.all(getProportionateScreenWidth(30)),
              decoration: BoxDecoration(
                // color: Color(0xFF515C6E),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF01CC72),
                ),
                child: Hero(
                  tag: "preview",
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: getProportionateScreenHeight(50),
                  ),
                ),
              )),
          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          content: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Success!!!",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(22),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Text(
                    title,
                    style: TextStyle(fontSize: getProportionateScreenWidth(15)),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Container(
                      width: getProportionateScreenWidth(80),
                      height: getProportionateScreenHeight(45),
                      child: RoundedButton(
                        press: () {
                          Navigator.of(context)
                              .pushReplacementNamed(MainScreen.id);
                        },
                        label: "Ok",
                        btnColor: kPrimaryButtonColor,
                      ))
                ],
              )),
        ),
      );

  //Get list of language from json file..........
  Future<List<LanguageModel>> getData(filter) async {
    var jsonText = await rootBundle.loadString('assets/languages.json');
    var languageData = jsonDecode(jsonText);
    final data = languageData;
    if (data != null) {
      var a = LanguageModel.fromJsonList(data);
      var r = {for (var i in a) i.code: i.name};
      print(r["en"]);
      return LanguageModel.fromJsonList(data);
    }
    return [];
  }
}
