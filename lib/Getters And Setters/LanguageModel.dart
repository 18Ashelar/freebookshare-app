class LanguageModel {
  String code;
  String name;

  LanguageModel({this.code, this.name});

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(code: json['code'], name: json['name']);
  }
  //
  static List<LanguageModel> fromJsonList(List list) {
    return list.map((item) => LanguageModel.fromJson(item)).toList();
  }

  @override
  String toString() => name;
}
