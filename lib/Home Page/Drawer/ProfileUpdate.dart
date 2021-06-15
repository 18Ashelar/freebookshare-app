import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/Constants.dart';
import 'package:freebookshare/SizeConfig.dart';
import 'package:freebookshare/Widgets/DropDown.dart';

class Profileupdate extends StatefulWidget {
  static String id = "Profile_Update";

  @override
  _ProfileupdateState createState() => _ProfileupdateState();
}

class _ProfileupdateState extends State<Profileupdate>
    with SingleTickerProviderStateMixin {
  TabController _TabControl;

  @override
  void initState() {
    _TabControl = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String _myActivity;
    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        child: Container(
          margin:
              EdgeInsets.symmetric(vertical: getProportionateScreenHeight(30)),
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(150),
                width: getProportionateScreenWidth(150),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/Avtar.png"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: getProportionateScreenHeight(50)),
                child: TabBar(
                  labelColor: Color(0xFFf12b96),
                  indicatorColor: Color(0xFFf12b96),
                  unselectedLabelColor: Color(0xFFef97d0),
                  tabs: [
                    Tab(
                      child: Text(
                        "Personal Details",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Contact Details",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    )
                  ],
                  controller: _TabControl,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(height: getProportionateScreenHeight(25)),
                            TextField(
                              keyboardType: TextInputType.name,
                              onChanged: (value) {},
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'First Name'),
                            ),
                            SizedBox(height: getProportionateScreenHeight(25)),
                            TextField(
                              keyboardType: TextInputType.name,
                              onChanged: (value) {},
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Last Name'),
                            ),
                            SizedBox(height: getProportionateScreenHeight(25)),
                            TextField(
                              keyboardType: TextInputType.name,
                              onChanged: (value) {
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Nick Name'),
                            ),
                            SizedBox(height: getProportionateScreenHeight(25)),
                            TextField(
                              keyboardType: TextInputType.name,
                              onChanged: (value) {
                              },
                              decoration:
                                  kTextFieldDecoration.copyWith(hintText: 'Age'),
                            ),
                            SizedBox(height: getProportionateScreenHeight(25)),
                            Container(
                              child: DropDownFormField(
                                hintText: 'Gender',
                                value: _myActivity,
                                onChanged: (value) {
                                  setState(() {
                                    _myActivity = value;
                                  });
                                  print(_myActivity);
                                },
                                dataSource: [
                                  {
                                    "display": "Male",
                                    "value": "Male",
                                  },
                                  {
                                    "display": "Female",
                                    "value": "Female",
                                  },
                                ],
                                textField: 'display',
                                valueField: 'value',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(height: getProportionateScreenHeight(25)),
                            
                            TextField(
                              keyboardType: TextInputType.name,
                              onChanged: (value) {},
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Country'),
                            ),
                            SizedBox(height: getProportionateScreenHeight(25)),

                            TextField(
                              keyboardType: TextInputType.number,
                              onChanged: (value) {},
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Phone No'),
                            ),
                            SizedBox(height: getProportionateScreenHeight(25)),

                            TextField(
                              keyboardType: TextInputType.name,
                              onChanged: (value) {
                              },
                              decoration:
                                  kTextFieldDecoration.copyWith(hintText: 'City'),
                            ),
                            SizedBox(height: getProportionateScreenHeight(25)),

                            TextField(
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                              },
                              decoration:
                                  kTextFieldDecoration.copyWith(hintText: 'Pin Code'),
                            ),
                            SizedBox(height: getProportionateScreenHeight(25)),

                            TextField(
                              keyboardType: TextInputType.name,
                              onChanged: (value) {
                              },
                              decoration:
                              kTextFieldDecoration.copyWith(hintText: 'Location'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  controller: _TabControl,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Color(0xFFf12b96)),
        onPressed: () => Navigator.of(context).pop(),
      ),
      elevation: 0,
      actions: [
        TextButton(
          onPressed: () {},
          child: Text("SAVE"),
          style: TextButton.styleFrom(
            textStyle: TextStyle(
              fontSize: 18.0,
            ),
            primary: Color(0xFFf12b96),
          ),
        )
      ],
      title: Text(
        "Free Book Share",
        style: TextStyle(
          color: Color(0xFFf12b96),
        ),
      ),
      backgroundColor: kBackgroundColor,
    );
  }
}
