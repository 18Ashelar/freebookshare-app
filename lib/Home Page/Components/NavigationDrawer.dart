import 'package:flutter/material.dart';
import 'package:freebookshare/Home%20Page/Drawer/MyBooks/MyBooks.dart';
import 'package:freebookshare/Home%20Page/Drawer/Profile/ProfileUpdate.dart';

import '../../Constants.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: kPrimaryColor,
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
          ListTile(
            leading: Icon(Icons.request_page),
            title: Text('My Requests'),
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
    );
  }
}
