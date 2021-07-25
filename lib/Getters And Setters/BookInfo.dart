import 'package:cloud_firestore/cloud_firestore.dart';

class BookInfo {
  final String userId;
  final String bookName;
  final String isbnNumber;
  final String bookCategory;
  final String published;
  final String publisher;
  final String author;
  final String pageCount;
  final String bookLanguage;
  final String bookDescription;
  final String imgPath;
  final Timestamp createdAt;
  final String lendingType;

  BookInfo(
      {this.userId,
      this.bookName,
      this.isbnNumber,
      this.bookCategory,
      this.published,
      this.publisher,
      this.author,
      this.bookDescription,
      this.bookLanguage,
      this.pageCount,
      this.imgPath,
      this.createdAt,
      this.lendingType});

  BookInfo.fromJson(Map<String, Object> book)
      : this(
          userId: book["user_id"] as String,
          bookName: book["title"] as String,
          isbnNumber: book["ISBN"] as String,
          bookCategory: book["category"] as String,
          published: book["published"] as String,
          publisher: book["publisher"] as String,
          author: book["author"] as String,
          pageCount: book["page_count"] as String,
          bookLanguage: book["language"] as String,
          bookDescription: book["description"] as String,
          imgPath: book["image_path"] as String,
          createdAt: book["createdAt"] as Timestamp,
          lendingType: book["lendingType"] as String,
        );

  Map<String, Object> toJson() {
    return {
      "user_id": userId,
      "title": bookName,
      "ISBN": isbnNumber,
      "category": bookCategory,
      "published": published,
      "publisher": publisher,
      "author": author,
      "page_count": pageCount,
      "language": bookLanguage,
      "description": bookDescription,
      "image_path": imgPath,
      "createdAt": createdAt,
      "lendingType": lendingType,
    };
  }

  @override
  String toString() {
    return 'BookInfo{userId: $userId, bookName: $bookName, isbnNumber: $isbnNumber, bookCategory: $bookCategory, published: $published, publisher: $publisher, author: $author, pageCount: $pageCount, bookLanguage: $bookLanguage, bookDescription: $bookDescription, imgPath: $imgPath, createdAt: $createdAt, lendingType: $lendingType}';
  }
}
