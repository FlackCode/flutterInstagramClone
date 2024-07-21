import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDocument(
      String UserID) async {
    return await _firestore.collection("users").doc(UserID).get();
  }

  saveEditedUserData(
      String nickname, String username, String bio, String profilePictureURL, String UserID) async {
    return await _firestore.collection("users").doc(UserID).set(
        {"username": username, "nickname": nickname, "bio": bio, "profilePictureURL": profilePictureURL},
        SetOptions(merge: true));
  }
}
