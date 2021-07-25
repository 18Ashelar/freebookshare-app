import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/FirebaseServices/BookFirebaseService.dart';
import 'package:freebookshare/Getters%20And%20Setters/BookInfo.dart';

import 'ProductInfoCard.dart';
import 'ShimmerEffectForBookInfoCard.dart';

class AllBookDataType {
  static BookFirebaseService service = BookFirebaseService();
  static List<BookInfo> list = [];

  static StreamBuilder<QuerySnapshot<BookInfo>> allBookData() {
    return StreamBuilder<QuerySnapshot<BookInfo>>(
        stream: service.allBookData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            list = snapshot.data.docs.map((e) => e.data()).toList();
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) => ProductInfoCard(
                      bookInfo: list[index],
                    ));
          } else {
            return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => ShimmerEffectForBookCard());
          }
        });
  }

  static StreamBuilder<QuerySnapshot<BookInfo>> freeBookData() {
    return StreamBuilder<QuerySnapshot<BookInfo>>(
        stream: service.freeBookData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            list = snapshot.data.docs.map((e) => e.data()).toList();
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) => ProductInfoCard(
                      bookInfo: list[index],
                    ));
          } else {
            return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => ShimmerEffectForBookCard());
          }
        });
  }

  static StreamBuilder<QuerySnapshot<BookInfo>> paidBookData() {
    return StreamBuilder<QuerySnapshot<BookInfo>>(
        stream: service.paidBookData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            list = snapshot.data.docs.map((e) => e.data()).toList();
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) => ProductInfoCard(
                      bookInfo: list[index],
                    ));
          } else {
            return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => ShimmerEffectForBookCard());
          }
        });
  }
}
