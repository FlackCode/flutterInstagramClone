import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDocument(String UserID) async {
    return await _firestore.collection("users").doc(UserID).get();
  }
  
}
