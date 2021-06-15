import 'package:flutter/material.dart';

class PopMenuBtnRightCorner extends StatelessWidget {
  PopMenuBtnRightCorner({this.icon});

  Icon icon;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: (context) => [
              PopupMenuItem(
                  child: Row(
                children: [
                  Icon(
                    Icons.logout,
                    color: Colors.black54,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text("Logout"),
                  )
                ],
              ))
            ],
        child: icon);
  }
}
