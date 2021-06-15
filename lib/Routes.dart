import 'Product/Screens/AddBookFormSecondPage.dart';
import 'Screens/AddBookRequest.dart';
import 'Screens/All_available_books.dart';
import 'package:freebookshare/Home%20Page/Drawer/ProfileUpdate.dart';
import 'package:freebookshare/HomeScreen.dart';
import 'package:freebookshare/LoginPage.dart';
import 'package:freebookshare/RegisterScreen.dart';
import 'package:freebookshare/Product/Screens/AddBookForm.dart';
import 'package:freebookshare/Product/Components/ProductDetails.dart';
import 'package:freebookshare/Request/Screens/MyRequestForBook.dart';
import 'package:freebookshare/TestLayout.dart';
import 'package:flutter/widgets.dart';

import 'WelcomePage.dart';

final Map<String,WidgetBuilder> routes={

  WelcomeScreen.id: (context) => WelcomeScreen(),
  LoginPage.id: (context) => LoginPage(),
  RegisterPage.id: (context) => RegisterPage(),
  HomeScreen.id: (context) => HomeScreen(),
  AddBookForm.id: (context) => AddBookForm(),
  AddBookFormSecond.id: (context) => AddBookFormSecond(),
  AddBookRequest.id: (context) => AddBookRequest(),
  AllAvailableBooks.id: (context) => AllAvailableBooks(),
  ProductDetails.id: (context) => ProductDetails(),
  MyRequestForBook.id:(context)=>MyRequestForBook(),
  TestLayout.id: (context) => TestLayout(),
  Profileupdate.id:(context)=>Profileupdate(),

};