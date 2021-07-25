import 'package:flutter/material.dart';

import '../Constants.dart';

class BottomNavigation {
  static BottomNavigationBar buildBottomNavigationBar(
      Function _onItemTapped, int _selectIndex) {
    return BottomNavigationBar(
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
    );
  }
}
