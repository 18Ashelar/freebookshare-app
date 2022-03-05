import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/FirebaseServices/UserFirebaseService.dart';
import 'package:freebookshare/Home%20Page/Drawer/MyBooks/MyBooks.dart';
import 'package:freebookshare/Home%20Page/Drawer/Profile/ProfileUpdate.dart';

import '../../Constants.dart';
import '../../SizeConfig.dart';
import '../../WelcomePage.dart';

class NavigationDrawer extends StatelessWidget {
  FirebaseServices service = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          FutureBuilder(
            future: service.userProfileData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data as DocumentSnapshot;
                if (data.exists) {
                  return UserAccountsDrawerHeader(
                    accountEmail: Text(
                      service.emailId(),
                      style: TextStyle(
                        fontSize: getProportionateScreenHeight(15),
                        color: Colors.white60,
                      ),
                    ),
                    accountName: Text(
                      data["firstname"] + " " + data["lastname"],
                      style: TextStyle(
                        fontSize: getProportionateScreenHeight(20),
                        color: Colors.white,
                      ),
                    ),
                    currentAccountPicture: CachedNetworkImage(
                      imageUrl: data["profile_image"],
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        backgroundImage: imageProvider,
                        radius: getProportionateScreenHeight(45),
                      ),
                      placeholder: (context, url) => CircleAvatar(
                        radius: getProportionateScreenHeight(45),
                      ),
                      errorWidget: (context, url, error) {
                        return CircleAvatar(
                          backgroundImage: AssetImage("assets/Avtar.png"),
                          radius: getProportionateScreenHeight(45),
                        );
                      },
                    ),
                  );
                } else {
                  return UserAccountsDrawerHeader(
                    accountEmail: Text(
                      service.emailId(),
                      style: TextStyle(
                        fontSize: getProportionateScreenHeight(15),
                        color: Colors.white60,
                      ),
                    ),
                    accountName: Text(
                      "abc",
                      style: TextStyle(
                        fontSize: getProportionateScreenHeight(20),
                        color: Colors.white,
                      ),
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage("assets/Avtar.png"),
                      radius: getProportionateScreenHeight(45),
                    ),
                  );
                }
              }
              return DrawerHeader(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                ),
                child: Center(
                  child: CircularProgressIndicator(
                    color: kBackgroundColor,
                    strokeWidth: 5,
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.perm_identity),
            title: Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, Profileupdate.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('My Books'),
            onTap: () {
              Navigator.pushNamed(context, MyBooks.id);
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.my_library_books_sharp),
          //   title: Text('My Requests'),
          //   onTap: () {
          //     Navigator.pushNamed(context,MyRequestForBook.id);
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Contact Us'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () async {
              await FirebaseAuth.instance.signOut().then((value) {
                Navigator.of(context).pushNamed(WelcomeScreen.id);
              });
            },
          ),
        ],
      ),
    );
  }
}
