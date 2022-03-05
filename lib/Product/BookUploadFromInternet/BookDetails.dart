import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freebookshare/Components/RoundedButton.dart';
import 'package:freebookshare/Getters%20And%20Setters/BookInfoFromInternetWithLanguage.dart';
import 'package:freebookshare/Getters%20And%20Setters/LanguageModel.dart';
import 'package:freebookshare/Product/BookUploadFromInternet/Components/BookJsonDataModel.dart';
import 'package:freebookshare/Product/Screens/AddBookForm.dart';

import '../../Constants.dart';
import '../../SizeConfig.dart';
import 'Components/BookDetailsShow.dart';
import 'Components/BookImage.dart';
import 'Components/BookJsonDataModel.dart';

class BookDetails extends StatelessWidget {
  static String id = "Book_Details";
  String isbn;
  String language;
  @override
  Widget build(BuildContext context) {
    final bookData =
        ModalRoute.of(context).settings.arguments as Map<String, BookData>;
    isbn = bookData["BookData"].volume.industryIdentifiers[0].identifier;
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Details"),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(20), horizontal: 10),
                child: Row(
                  children: [
                    BookImage(
                      thumbnail:
                          bookData["BookData"].volume.imageLinks.thumbnail,
                      smallThumnail:
                          bookData["BookData"].volume.imageLinks.smallThumbnail,
                    ),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.only(
                            left: getProportionateScreenWidth(10),
                          ),
                          height: getProportionateScreenHeight(240),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BookDetailsShow(
                                title: "Title: ",
                                value: bookData["BookData"].volume.title,
                              ),
                              BookDetailsShow(
                                title: "Publisher: ",
                                value: bookData["BookData"].volume.publisher,
                              ),
                              BookDetailsShow(
                                title: "Published: ",
                                value:
                                    bookData["BookData"].volume.publishedDate,
                              ),
                              BookDetailsShow(
                                title: "Author: ",
                                value: bookData["BookData"].volume.authors[0],
                              ),
                              buildContainer(
                                  bookData["BookData"].volume.language),
                              BookDetailsShow(
                                title: "ISBN: ",
                                value: isbn != null
                                    ? isbn
                                    : bookData["BookData"]
                                        .volume
                                        .industryIdentifiers[1]
                                        .identifier,
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: BookDetailsShow(
                  title: "PageCount: ",
                  value: bookData["BookData"].volume.pageCount.toString(),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: BookDetailsShow(
                  title: "Category: ",
                  value: bookData["BookData"].volume.categories[0],
                ),
              ),
              Container(
                height: getProportionateScreenHeight(250),
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenHeight(18),
                      ),
                    ),
                    Flexible(
                        child: Text(
                      bookData["BookData"].volume.description ?? "",
                      maxLines: 13,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: getProportionateScreenHeight(15)),
                    )),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: getProportionateScreenHeight(85),
                width: double.infinity,
                child: RoundedButton(
                  label: "Edit",
                  btnColor: kPrimaryButtonColor,
                  textColor: Colors.white,
                  press: () {
                    Navigator.pushNamed(context, AddBookForm.id,
                        arguments: BookInfoFromInternetWithLanguage(
                            bookData: bookData["BookData"],
                            language: language));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer(String languageCode) {
    return Container(
      child: FutureBuilder<String>(
          future: getJsonData(languageCode),
          builder: ((BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              language = snapshot.data;
              return BookDetailsShow(
                title: "Language: ",
                value: snapshot.data,
              );
            }
            return BookDetailsShow(
              title: "Language: ",
              value: "",
            );
          })),
    );
  }

  Future<String> getJsonData(String code) async {
    var jsonText = await rootBundle.loadString('assets/languages.json');
    var languageData = jsonDecode(jsonText);
    if (languageData != null) {
      var languageList = LanguageModel.fromJsonList(languageData);
      var languageMap = {for (var i in languageList) i.code: i.name};
      return languageMap[code];
    }
    return "";
  }
}
