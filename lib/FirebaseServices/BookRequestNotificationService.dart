import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freebookshare/Getters%20And%20Setters/BookRequestNotification.dart';

class BookRequestService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  String uid() {
    return auth.currentUser.uid;
  }

  CollectionReference bookRequestUpdate =
      FirebaseFirestore.instance.collection('Book_Request_Notification');

  final bookRequest = FirebaseFirestore.instance
      .collection('Book_Request_Notification')
      .withConverter<BookRequestNotification>(
        fromFirestore: (snapshot, _) =>
            BookRequestNotification.fromJson(snapshot.data()),
        toFirestore: (bookRequest, _) => bookRequest.toJson(),
      );

  Stream<QuerySnapshot<BookRequestNotification>> allBookRequest() {
    return bookRequest
        .where('requestReceiverUserId', isEqualTo: uid())
        .orderBy("createdAt", descending: true)
        .snapshots();
  }

  Stream<QuerySnapshot<BookRequestNotification>> getSingleRequest(
      String bookId) {
    return bookRequest
        .where('requestSenderUserId', isEqualTo: uid())
        .where("bookId", isEqualTo: bookId)
        .snapshots();
  }

  //My request
  Stream<QuerySnapshot<BookRequestNotification>> allMyBookRequest() {
    return bookRequest
        .where('requestSenderUserId', isEqualTo: uid())
        .orderBy("createdAt", descending: true)
        .snapshots();
  }

  Future<void> updateBookRequest(String bookRequestId, String status) {
    return bookRequestUpdate
        .doc(bookRequestId)
        .update({'requestStatus': status});
  }

  Future<void> deleteRequest(String bookRequestId) {
    return bookRequest.doc(bookRequestId).delete();
  }
}
