import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/Constants.dart';
import 'package:freebookshare/FirebaseServices/BookRequestNotificationService.dart';
import 'package:freebookshare/Getters%20And%20Setters/BookRequestNotification.dart';
import 'package:freebookshare/Home%20Page/Components/LatestBookShimmerEffect.dart';
import 'package:freebookshare/SizeConfig.dart';

import 'Components/CircularLoader.dart';
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
  List<String> bookId = [];
  bool _isProgress = false;

  //Data For Book Request
  BookRequestService bookRequestService = BookRequestService();
  List<BookRequestNotification> requestInfo = [];
  List<String> bookRequestId = [];

  int count1 = 0;
  int count2 = 0;
  int requestLength = 0;

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
          child: Stack(
            children: [
              Column(
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
                                      fontSize:
                                          getProportionateScreenHeight(30),
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
                                bookId = snapshot.data.docs
                                    .map((e) => e.id)
                                    .toList();
                                if (list.length == 0) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0),
                                    child: Center(
                                        child: Container(
                                            child: Text(
                                                "No book data available."))),
                                  );
                                }
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
                                          bookId: bookId[index],
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

                  //Request For Book
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
                        StreamBuilder<QuerySnapshot<BookRequestNotification>>(
                            stream: bookRequestService.allBookRequest(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Container(
                                      child: Text("No Book Request found!")),
                                );
                              }
                              if (snapshot.hasData) {
                                requestInfo = snapshot.data.docs
                                    .map((e) => e.data())
                                    .toList();
                                bookRequestId = snapshot.data.docs
                                    .map((e) => e.id)
                                    .toList();

                                requestLength = requestInfo.length;

                                if (requestInfo.length == 0) {
                                  return Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: Container(
                                        child: Text("No Book Request found!")),
                                  );
                                } else {
                                  return ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: requestInfo.length,
                                      itemBuilder: (context, index) {
                                        if (requestInfo[index].requestStatus !=
                                                "Rejected" &&
                                            requestInfo[index].requestStatus !=
                                                "Accepted") {
                                          count1++;
                                          return MyBookRequestCard(
                                            bookRequestNotification:
                                                requestInfo[index],
                                            bookId: bookRequestId[index],
                                          );
                                        } else {
                                          count2++;
                                          return Container();
                                        }
                                      });
                                }
                              }
                              return Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Container(
                                    child: Text("No Book Request found!")),
                              );
                            }),
                        (count1 == 0 && requestLength != 0)
                            ? Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Container(
                                    child: Text("No Book Request found!")),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
              (_isProgress) ? CircularLoading() : Center(),
            ],
          ),
        ),
      ),
    );
  }
}
