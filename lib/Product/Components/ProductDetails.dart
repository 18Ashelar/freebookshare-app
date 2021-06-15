import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:freebookshare/Components/PopUpMenuRightCorner.dart';
import '../../Constants.dart';
import '../../SizeConfig.dart';
import 'BookInfoShow.dart';

class ProductDetails extends StatefulWidget {
  static String id = "Product_Details";

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      //  appBar: buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Stack(
              children: [
                //BackGround Container
                Container(
                  margin: EdgeInsets.only(top:getProportionateScreenHeight(160)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: kBackgroundColor,
                  ),
                ),
                Positioned(
                  left: getProportionateScreenWidth(60),
                  right:getProportionateScreenWidth(60),
                  child: Container(
                    height: getProportionateScreenHeight(260),
                    margin: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding, vertical: kDefaultPadding),
                    decoration: BoxDecoration(
                      boxShadow: [kDefaultShadow],
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/bookImage/3.jpg"),
                      ),
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:getProportionateScreenHeight(290),
                    left: getProportionateScreenWidth(15),
                    right: getProportionateScreenWidth(15),
                  ),
                  child: TabBar(
                    labelColor:Color(0xFFf12b96),
                    indicatorColor:Color(0xFFf12b96),
                    unselectedLabelColor: Color(0xFFef97d0),
                    tabs: [
                      Tab(
                        child: Text("Book Details",style: TextStyle(
                          fontSize: 16.0,
                        ),),
                      ),
                      Tab(
                        child: Text("Review",style: TextStyle(
                          fontSize: 16.0,
                        ),),
                      )
                    ],
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                ),
                Container(
                  height: getProportionateScreenHeight(400),
                  margin: EdgeInsets.only(top:getProportionateScreenHeight(340)),
                  child: Material(
                    color:kBackgroundColor,
                    child: TabBarView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: getProportionateScreenWidth(15),
                            right: getProportionateScreenWidth(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              BookInfoShow(
                                title: "Title: ",
                                value:
                                "Head First Java Book is very beautiful book and like it so much ",
                                maxLine: 1,
                              ),
                              BookInfoShow(
                                title: "ISBN: ",
                                value: "123123456789",
                                maxLine: 1,
                              ),
                              BookInfoShow(
                                title: "Created At: : ",
                                value: "20/10/2020",
                                maxLine: 1,
                              ),
                              BookInfoShow(
                                title: "Pin Code: ",
                                value: "400701",
                                maxLine: 1,
                              ),
                              BookInfoShow(
                                title: "Pages: ",
                                value: "500",
                                maxLine: 1,
                              ),
                              BookInfoShow(
                                title: "Location: ",
                                value: "Mumbai",
                                maxLine: 1,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Description: ",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "This is the best book i have ever see in my so please read it carefully it will change your life so please take care then now forever",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  TextButton(
                                    child: Text("Request"),
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                        textStyle: TextStyle(fontSize: 20.0),
                                        backgroundColor:Color(0xFF7a1fa2),
                                        primary: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        )),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Free to Share",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Request Status: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  Text(
                                    "Accepted.",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                  height: getProportionateScreenHeight(50),
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed:null,
                                    child: Text("Chat"),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),
                                      textStyle: TextStyle(
                                        fontSize: 22.0,
                                      ),
                                      primary: kSuccessButtonColor,
                                      onPrimary: Colors.white,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Container(margin: EdgeInsets.only(
                          left: getProportionateScreenWidth(15),
                          right: getProportionateScreenWidth(15),
                        ),color: Colors.white)
                      ],
                      controller: _tabController,
                    ),
                  ),
                ),
              ],
            )),


          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text("Free Book Share"),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: PopMenuBtnRightCorner(icon: Icon(Icons.more_vert)),
        ),
      ],
    );
  }
}
