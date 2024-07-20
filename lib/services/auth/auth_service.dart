import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<UserCredential> registerWithEmailAndPass(
      String email, String password, String username) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await _firestore.collection("users").doc(userCredential.user!.uid).set({
        "nickname": null,
        "username": username,
        "email": email,
        "uid": userCredential.user!.uid,
        "profilePictureURL": null,
        "bio": null,
        "posts": [],
        "followers": [],
        "following": [],
        "createdAt": Timestamp.now()
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      throw Exception(e.message);
    }
  }

  Future<UserCredential> loginWithEmailAndPass(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      throw Exception(e.message);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
