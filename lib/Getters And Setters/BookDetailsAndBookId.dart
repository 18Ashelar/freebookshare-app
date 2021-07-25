import 'BookInfo.dart';

class BookDetailsAndBookId {
  BookInfo info;
  String bookId;

  BookDetailsAndBookId({this.info, this.bookId});

  @override
  String toString() {
    return 'BookDetailsAndBookId{info: $info, bookId: $bookId}';
  }
}
