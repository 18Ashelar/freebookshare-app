import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/Constants.dart';
import 'package:freebookshare/MainScreen.dart';
import 'package:freebookshare/Product/Screens/AddBookFormSecondPage.dart';
import 'package:freebookshare/WelcomePage.dart';

import 'Getters And Setters/BookDetailsAndBookId.dart';
import 'Product/Screens/AddBookForm.dart';
import 'Routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription<User> user;
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  void dispose() {
    user.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? WelcomeScreen.id
          : MainScreen.id,
      routes: routes,
      onGenerateRoute: (settings) {
        if (settings.name == AddBookForm.id) {
          final args = settings.arguments as dynamic;
          return MaterialPageRoute(builder: (context) {
            if (args is BookDetailsAndBookId) {
              return AddBookForm(
                bookInfoAndBookId: args,
              );
            } else {
              return AddBookForm.onlineBookData(
                bookInfoWithLanguage: args,
              );
            }
          });
        } else if (settings.name == AddBookFormSecond.id) {
          final args = settings.arguments as dynamic;
          return MaterialPageRoute(builder: (context) {
            return AddBookFormSecond(
              secondFormBookData: args,
            );
          });
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        //  canvasColor: Colors.transparent,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
    );
  }
}
