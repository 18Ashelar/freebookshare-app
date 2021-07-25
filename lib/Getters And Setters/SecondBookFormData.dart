import 'dart:io';

import 'BookDetailsAndBookId.dart';
import 'BookInfoFromInternetWithLanguage.dart';

class SecondFormBookData {
  BookDetailsAndBookId bookDetailsAndBookId;
  BookInfoFromInternetWithLanguage bookInfoWithLanguage;
  String title;
  String isbn;
  String category;
  File bookImage;

  SecondFormBookData(
      {this.bookDetailsAndBookId,
      this.title,
      this.category,
      this.bookImage,
      this.isbn});

  SecondFormBookData.onlineBookData(
      {this.bookInfoWithLanguage,
      this.title,
      this.category,
      this.bookImage,
      this.isbn});

  @override
  String toString() {
    return 'SecondFormBookData{bookDetailsAndBookId: $bookDetailsAndBookId, title: $title, isbn: $isbn, category: $category, bookImage: $bookImage}';
  }
}
