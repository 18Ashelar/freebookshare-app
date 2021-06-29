import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/Constants.dart';
import 'package:freebookshare/Routes.dart';
import 'package:freebookshare/WelcomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: routes,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        //  canvasColor: Colors.transparent,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
    );
  }
}
