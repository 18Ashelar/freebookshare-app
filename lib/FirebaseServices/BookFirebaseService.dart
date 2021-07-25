import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:freebookshare/Getters%20And%20Setters/BookInfo.dart';

class BookFirebaseService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  String uid() {
    return auth.currentUser.uid;
  }

  Future<String> addBookImage(File bookImage, String title) async {
    final ref =
        storage.ref().child("book_images").child(uid()).child(title + ".jpg");
    await ref.putFile(bookImage);

    return await ref.getDownloadURL();
  }

  final bookRef =
      FirebaseFirestore.instance.collection('Books').withConverter<BookInfo>(
            fromFirestore: (snapshot, _) => BookInfo.fromJson(snapshot.data()),
            toFirestore: (movie, _) => movie.toJson(),
          );

  Stream<QuerySnapshot<BookInfo>> latestBookData() {
    return bookRef.limit(10).orderBy("createdAt", descending: true).snapshots();
  }

  Stream<QuerySnapshot<BookInfo>> allBookData() {
    return bookRef.orderBy("createdAt", descending: true).snapshots();
  }

  Stream<QuerySnapshot<BookInfo>> freeBookData() {
    return bookRef
        .where("lendingType", isEqualTo: "Free to Share")
        .orderBy("createdAt", descending: true)
        .snapshots();
  }

  Stream<QuerySnapshot<BookInfo>> paidBookData() {
    return bookRef
        .where("lendingType", isEqualTo: "For Sale")
        .orderBy("createdAt", descending: true)
        .snapshots();
  }

  Stream<QuerySnapshot<BookInfo>> userBooks() {
    return bookRef.where('user_id', isEqualTo: uid()).snapshots();
  }
}
