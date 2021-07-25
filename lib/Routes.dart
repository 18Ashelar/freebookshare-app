import 'package:flutter/widgets.dart';
import 'package:freebookshare/Home%20Page/Drawer/MyBooks/MyBooks.dart';
import 'package:freebookshare/Home%20Page/Drawer/Profile/ProfileUpdate.dart';
import 'package:freebookshare/HomeScreen.dart';
import 'package:freebookshare/Login%20and%20Registration/Screens/LoginPage.dart';
import 'package:freebookshare/Login%20and%20Registration/Screens/RegisterScreen.dart';
import 'package:freebookshare/MainScreen.dart';
import 'package:freebookshare/Product/BookUploadFromInternet/BookDetails.dart';
import 'package:freebookshare/Product/Screens/ProductDetails.dart';
import 'package:freebookshare/Request/Screens/MyRequestForBook.dart';
import 'package:freebookshare/Screens/AddBookRequest.dart';
import 'package:freebookshare/TestFile/TestLayout.dart';

import 'Product/BookUploadFromInternet/BookLoaderFromGoogle.dart';
import 'Product/Screens/All_available_books.dart';
import 'Screens/ImageTapZoom.dart';
import 'TestFile/BarcodeScanner.dart';
import 'WelcomePage.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.id: (context) => WelcomeScreen(),
  LoginPage.id: (context) => LoginPage(),
  RegisterPage.id: (context) => RegisterPage(),
  MainScreen.id: (context) => MainScreen(),
  HomeScreen.id: (context) => HomeScreen(),
  BookLoaderFromInternet.id: (context) => BookLoaderFromInternet(),
  BookDetails.id: (context) => BookDetails(),
  // AddBookForm.id: (context) => AddBookForm(),
  // AddBookFormSecond.id: (context) => AddBookFormSecond(),
  AllAvailableBooks.id: (context) => AllAvailableBooks(),
  ProductDetails.id: (context) => ProductDetails(),
  MyRequestForBook.id: (context) => MyRequestForBook(),
  Profileupdate.id: (context) => Profileupdate(),
  ImageZoomTap.id: (context) => ImageZoomTap(),
  AddBookRequest.id: (context) => AddBookRequest(),
  MyBooks.id: (context) => MyBooks(),

  //For Testing purpose
  BarcodeScanner.id: (context) =>
      BarcodeScanner(ModalRoute.of(context).settings.arguments),
  TestLayout.id: (context) => TestLayout(),
};
