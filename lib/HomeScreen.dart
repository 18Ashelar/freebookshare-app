import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/Constants.dart';
import 'package:freebookshare/Home%20Page/Components/LatestBookShimmerEffect.dart';
import 'package:freebookshare/SizeConfig.dart';

import 'Components/ImageSliderDesign.dart';
import 'FirebaseServices/BookFirebaseService.dart';
import 'Getters And Setters/BookInfo.dart';
import 'Home Page/Components/TopNavigationBar.dart';
import 'Product/Components/ProductCard.dart';
import 'Request/Components/MyBookRequestCard.dart';
import 'SectionTitle.dart';

class HomeScreen extends StatefulWidget {
  static String id = "Home_Screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  BookFirebaseService service = BookFirebaseService();
  List<BookInfo> list = [];

  @override
  Widget build(BuildContext context) {
    //To get userId when user login
    // final routesData =
    //     ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    // final userId = routesData['userId'];
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: getProportionateScreenHeight(170),
                //color: Colors.red,
                child: Stack(
                  children: [
                    //App Bar Title and Logo
                    Container(
                      height: getProportionateScreenHeight(150),
                      padding: EdgeInsets.only(
                        left: getProportionateScreenWidth(25),
                        right: getProportionateScreenWidth(25),
                        bottom: getProportionateScreenHeight(80),
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
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenHeight(30),
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
                      left: getProportionateScreenWidth(20),
                      right: getProportionateScreenWidth(20),
                      bottom: getProportionateScreenHeight(25),
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
                      // press: () {
                      //   Navigator.pushNamed(context, AllAvailableBooks.id);
                      //}
                    ),
                    StreamBuilder<QuerySnapshot<BookInfo>>(
                        stream: service.latestBookData(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            list = snapshot.data.docs
                                .map((e) => e.data())
                                .toList();
                            return Container(
                              //color: Colors.red,
                              height: getProportionateScreenHeight(210),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: list.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ProductCard(
                                      bookInfo: list[index],
                                    );
                                  }),
                            );
                          } else {
                            return LatestBookShimmerEffect();
                          }
                        }),
                  ],
                ),
              ),

              //Book Requirement
              // Container(
              //   padding: EdgeInsets.symmetric(
              //       vertical: getProportionateScreenHeight(15),
              //       horizontal: getProportionateScreenWidth(15)),
              //   child: Column(
              //     children: [
              //       SectionTitle(
              //           title: "Book Requirements",
              //           press: () {
              //             Navigator.pushNamed(context, AllAvailableBooks.id);
              //           }),
              //       SingleChildScrollView(
              //         scrollDirection: Axis.horizontal,
              //         child: Row(
              //           children: [
              //             ...List.generate(
              //                 bookimgList.length,
              //                 (index) => InkWell(
              //                       onTap: () {
              //                         Navigator.pushNamed(
              //                             context, ProductDetails.id,
              //                             arguments: {"BookInfo": list[index]});
              //                       },
              //                       child: ProductCard(
              //                         imgPath: bookimgList[index],
              //                       ),
              //                     )),
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // ),

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
                      margin: EdgeInsets.only(
                          right: getProportionateScreenWidth(150)),
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
    );
  }
}
