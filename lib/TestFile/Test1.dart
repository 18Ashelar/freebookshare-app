import 'dart:convert';


class book {

  final int id;

   book({this.id});


   factory book.fromJson(Map<String,dynamic> json)
   {
     return book(
       id: json["totalItems"]
     );
   }


}