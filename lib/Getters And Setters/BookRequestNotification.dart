import 'package:cloud_firestore/cloud_firestore.dart';

class BookRequestNotification {
  String requestReceiverUserId;
  String requestSenderUserId;
  String bookId;
  String requestStatus;
  Timestamp createdAt;
  String longitude;
  String latitude;

  BookRequestNotification(
      {this.requestReceiverUserId,
      this.requestSenderUserId,
      this.requestStatus,
      this.bookId,
      this.createdAt,
      this.latitude,
      this.longitude});

  BookRequestNotification.fromJson(Map<String, Object> bookRequest)
      : this(
            requestReceiverUserId:
                bookRequest["requestReceiverUserId"] as String,
            requestSenderUserId: bookRequest["requestSenderUserId"] as String,
            bookId: bookRequest["bookId"] as String,
            requestStatus: bookRequest["requestStatus"] as String,
            latitude: bookRequest["latitude"] as String,
            longitude: bookRequest["longitude"] as String,
            createdAt: bookRequest["createdAt"] as Timestamp);

  Map<String, Object> toJson() {
    return {
      "requestReceiverUserId": requestReceiverUserId,
      "requestSenderUserId": requestSenderUserId,
      "bookId": bookId,
      "requestStatus": requestStatus,
      "latitude": latitude,
      "longitude": longitude,
      "createdAt": createdAt,
    };
  }

  @override
  String toString() {
    return 'BookRequestNotification{requestReceiverUserId: $requestReceiverUserId, requestSenderUserId: $requestSenderUserId, bookId: $bookId, requestStatus: $requestStatus, createdAt: $createdAt, longitude: $longitude, latitude: $latitude}';
  }
}
