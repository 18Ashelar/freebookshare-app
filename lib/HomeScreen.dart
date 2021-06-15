import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freebookshare/Constants.dart';
import 'package:freebookshare/Request/Screens/MyRequestForBook.dart';
import 'package:freebookshare/SizeConfig.dart';
import 'package:freebookshare/TestLayout.dart';
import 'Components/ImageSliderDesign.dart';
import 'Components/ProductCard.dart';
import 'Home Page/Components/NavigationDrawer.dart';
import 'Home Page/Components/TopNavigationBar.dart';
import 'Product/Components/ProductInfoCard.dart';
import 'Product/Screens/AddBookForm.dart';
import 'Request/Components/MyBookRequestCard.dart';
import 'Screens/AddBookRequest.dart';
import 'Screens/All_available_books.dart';
import 'SectionTitle.dart';

class HomeScreen extends StatefulWidget {
  static String id = "Home_Screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  var Scaffoldkey = GlobalKey<ScaffoldState>();

  int _selectIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });

    switch (_selectIndex) {
      case 0:
        Navigator.pushNamed(context, AllAvailableBooks.id);
        break;
      case 1:
        Navigator.pushNamed(context, MyRequestForBook.id);
        break;
      case 2:
        Navigator.pushNamed(context, MyRequestForBook.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      key: Scaffoldkey,
      drawer: NavigationDrawer(),
      appBar: buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: getProportionateScreenHeight(170),
                // color: Colors.red,
                child: Stack(
                  children: [

                    //App Bar Title and Logo
                    Container(
                      height: getProportionateScreenHeight(150),
                      padding: EdgeInsets.only(
                        left: kDefaultPadding,
                        right: kDefaultPadding,
                        bottom: 60 + kDefaultPadding,
                      ),
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                            bottomRight: Radius.circular(36),
                          )),
                      child: Row(
                        children: [
                          Text(
                            "Free Book Share",
                            style: Theme.of(context).textTheme.headline5.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Spacer(),
                          Image.asset(
                            "assets/bookLogo.png",
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),

                    //Top Navigation Bar
                    Positioned(
                      left: getProportionateScreenWidth(30),
                      right: getProportionateScreenWidth(30),
                      bottom: getProportionateScreenHeight(30),
                      child: TopNavigationBar(),
                    )
                  ],
                ),
              ),

              //Contain Carosal
              Container(
                  width: double.infinity,
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

                    ],
                  )),

              //Latest Book Slider
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(15),
                    horizontal: getProportionateScreenWidth(15)),
                child: Column(
                  children: [
                    SectionTitle(
                        title: "Latest Book",
                        press: () {
                          Navigator.pushNamed(
                              context, AllAvailableBooks.id);
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


              //Book Requirement
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(15),
                    horizontal: getProportionateScreenWidth(15)),
                child: Column(
                  children: [
                    SectionTitle(
                        title: "Book Requirements",
                        press: () {
                          Navigator.pushNamed(
                              context, AllAvailableBooks.id);
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

              // Request For Your Books
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(15),
                    horizontal: getProportionateScreenWidth(5)),
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        "Request For Your Book",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          color: Colors.black,
                        ),
                      ),
                      margin:EdgeInsets.only(right:getProportionateScreenWidth(150)),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: bookimgList.length,
                        itemBuilder: (context, index) => MyBookRequestCard(
                          imgPath: bookimgList[index],
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Books"),
          BottomNavigationBarItem(icon: Icon(Icons.request_page), label: "My Requests"),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: "Contact Us"),
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
        IconButton(onPressed: (){
          Navigator.pushNamed(context, TestLayout.id);
        },icon:Icon(Icons.notifications,color: Colors.white,)),
      ],
      leading: IconButton(
        icon: SvgPicture.asset("assets/menu.svg"),
        onPressed: () {
          Scaffoldkey.currentState.openDrawer();
        },
      ),
      backgroundColor: kPrimaryColor,
      elevation: 0,
    );
  }
}
