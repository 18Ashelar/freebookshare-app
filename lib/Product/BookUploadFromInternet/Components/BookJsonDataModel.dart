class BookInfoFromInternet {
  final List<BookData> data;

  BookInfoFromInternet({this.data});

  factory BookInfoFromInternet.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['items'] as List;
    List<BookData> bookDataList =
    list.map((i) => BookData.fromJson(i)).toList();

    return BookInfoFromInternet(data: bookDataList);
  }
}

class BookData {
  String id;
  VolumeInfo volume;
  BookData({this.id, this.volume});

  factory BookData.fromJson(Map<String, dynamic> parsedJson) {
    return BookData(
        id: parsedJson['id'],
        volume: VolumeInfo.fromJson(parsedJson['volumeInfo']));
  }
}

class VolumeInfo {
  String title;
  String publisher;
  String publishedDate;
  String description;
  int pageCount;
  String language;
  List<IndustryIdentifiers> industryIdentifiers;
  List<String> categories;
  List<String> authors;
  ImageLinks imageLinks;

  VolumeInfo(
      {this.title,
        this.publisher,
        this.publishedDate,
        this.description,
        this.pageCount,
        this.language,
        this.industryIdentifiers,
        this.categories,
        this.authors,
        this.imageLinks});

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    //List for Isbn Number
    var list = json['industryIdentifiers'] as List;
    List<IndustryIdentifiers> isbnDataType =
    list.map((i) => IndustryIdentifiers.fromJson(i)).toList();

    //List for categories
    var categoryFromJson = json['categories'];
    List<String> categoryList = new List<String>.from(categoryFromJson ?? [""]);

    //List for authors
    var authorListJson = json['authors'];
    List<String> authorsList = new List<String>.from(authorListJson ?? [""]);

    return VolumeInfo(
        title: json['title'],
        publisher: json['publisher'],
        publishedDate: json['publishedDate'],
        description: json['description'],
        pageCount: json['pageCount'],
        language: json['language'],
        industryIdentifiers: isbnDataType,
        categories: categoryList,
        authors: authorsList,
        imageLinks: ImageLinks.fromJson(json['imageLinks'] ?? {}));
  }
}

class IndustryIdentifiers {
  String type;
  String identifier;

  IndustryIdentifiers({this.type, this.identifier});

  factory IndustryIdentifiers.fromJson(Map<String, dynamic> parsedJson) {
    return IndustryIdentifiers(
        type: parsedJson['type'], identifier: parsedJson['identifier']);
  }
}

class ImageLinks {
  String thumbnail;
  String smallThumbnail;
  ImageLinks({this.thumbnail, this.smallThumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> parsedJson) {
    return ImageLinks(
        thumbnail: parsedJson["thumbnail"],
        smallThumbnail: parsedJson["smallThumbnail"]);
  }
}
