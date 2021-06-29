import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/Components/ImageSliderDesign.dart';
import 'package:freebookshare/Product/Screens/All_available_books.dart';
import 'package:freebookshare/SectionTitle.dart';
import 'package:freebookshare/SizeConfig.dart';

import 'Components/PopUpMenuRightCorner.dart';
import 'Constants.dart';
import 'Product/Components/ProductCard.dart';
import 'Product/Screens/AddBookForm.dart';

class HomePage extends StatefulWidget {
  static const String id = "Home_Screen";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  int _selectIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });

    switch (_selectIndex) {
      case 1:
        Navigator.pushNamed(context, AddBookForm.id);
        break;
      case 2:
      // Navigator.pushNamed(context, AddBookRequest.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Free Book Share"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: PopMenuBtnRightCorner(icon: Icon(Icons.more_vert)),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Your Books'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.request_page),
              title: Text('Your Requests'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            width: double.infinity,
            height: size.height,
            child: Column(
              children: [
                CarouselSlider(
                  items: CourosalSliderIndicator.imageSliders,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
                CourosalSliderIndicator(current: _current),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(15),
                      horizontal: getProportionateScreenWidth(15)),
                  child: Column(
                    children: [
                      SectionTitle(
                          title: "Latest Book",
                          press: () {
                            Navigator.pushNamed(context, AllAvailableBooks.id);
                          }),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                                bookimgList.length,
                                (index) => ProductCard(
                                      imgPath: bookimgList[index],
                                    )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(15),
                      horizontal: getProportionateScreenWidth(15)),
                  child: Column(
                    children: [
                      SectionTitle(title: "Book Request", press: () {}),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                                bookimgList.length,
                                (index) => ProductCard(
                                      imgPath: bookimgList[index],
                                    )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Add Book"),
          BottomNavigationBarItem(
              icon: Icon(Icons.request_page), label: "Add Request"),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: "Contact Us"),
        ],
        backgroundColor: Colors.deepOrangeAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        currentIndex: _selectIndex,
        unselectedFontSize: 14,
        onTap: _onItemTapped,
      ),
    );
  }
}
