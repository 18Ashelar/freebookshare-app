import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freebookshare/HomeScreen.dart';

import 'Constants.dart';
import 'Home Page/Components/NavigationDrawer.dart';
import 'Product/Screens/All_available_books.dart';
import 'Request/Screens/MyRequestForBook.dart';
import 'SizeConfig.dart';
import 'TestFile/TestLayout.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);
  static String id = "Main_Screen";
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var drawerKey = GlobalKey<ScaffoldState>();
  int _selectIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  // List<GlobalKey<NavigatorState>> _navigatorKeys = [
  //   GlobalKey<NavigatorState>(),
  //   GlobalKey<NavigatorState>(),
  //   GlobalKey<NavigatorState>()
  // ];

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    AllAvailableBooks(),
    MyRequestForBook(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      drawer: NavigationDrawer(),
      appBar: buildAppBar(),
      body: _widgetOptions.elementAt(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_sharp), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Books"),
          BottomNavigationBarItem(
              icon: Icon(Icons.request_page), label: "My Requests"),
        ],
        backgroundColor: kPrimaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        currentIndex: _selectIndex,
        unselectedFontSize: 14,
        onTap: _onItemTapped,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, TestLayout.id);
            },
            icon: Icon(
              Icons.notifications,
              size: getProportionateScreenHeight(30),
              color: Colors.white,
            )),
      ],
      leading: IconButton(
        icon: SvgPicture.asset("assets/menu.svg"),
        onPressed: () {
          drawerKey.currentState.openDrawer();
        },
      ),
      backgroundColor: kPrimaryColor,
      elevation: 0,
    );
  }
  //
  // Map<String, WidgetBuilder> _routeBuilder(BuildContext context, int index) {
  //   return {
  //     '/': (context) {
  //       return [
  //         HomeScreen(),
  //         AllAvailableBooks(),
  //         MyRequestForBook(),
  //       ].elementAt(index);
  //     },
  //   };
  // }
  //
  // Widget _buildStageNavigator(int index) {
  //   var routedBuilders = _routeBuilder(context, index);
  //
  //   return Offstage(
  //     offstage: _selectIndex != index,
  //     child: Navigator(
  //         key: _navigatorKeys[index],
  //         onGenerateRoute: (routeSettings) {
  //           return MaterialPageRoute(
  //             builder: (context) => routedBuilders[routeSettings.name](context),
  //           );
  //         }),
  //   );
  // }

}
