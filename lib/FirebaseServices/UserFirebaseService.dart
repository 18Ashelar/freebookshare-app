import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:freebookshare/Getters%20And%20Setters/UserInfo.dart';

class FirebaseServices {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  CollectionReference users = FirebaseFirestore.instance.collection("Users");

  String uid() {
    return auth.currentUser.uid;
  }

  String emailId() {
    return auth.currentUser.email;
  }

  Future<String> addUserProfilePhoto(File profileImage) async {
    final ref = storage.ref().child("user_profile_image").child(uid() + ".jpg");
    await ref.putFile(profileImage);

    return await ref.getDownloadURL();
  }

  Future<void> addUserProfileData(UserProfile user) async {
    return users.doc(uid()).set({
      "firstname": user.firstName,
      "lastname": user.lastName,
      "nickname": user.nickName,
      "age": user.age,
      "gender": user.gender,
      "contact": {
        "phone_no": user.phoneNo,
        "country": user.country,
        "city": user.city,
        "pin_code": user.pinCode
      },
      "profile_image": user.profileImage,
      "createdAt": Timestamp.now(),
    });
  }

  Future userProfileData() async {
    return await users.doc(uid()).get();
  }
}
