import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterinstagramclone/components/follower_item.dart';
import 'package:flutterinstagramclone/pages/profile_page.dart';
import 'package:flutterinstagramclone/services/auth/auth_service.dart';
import 'package:flutterinstagramclone/services/firestore/firestore_service.dart';

class FollowsPage extends StatelessWidget {
  final String pageType;

  const FollowsPage({super.key, required this.pageType});

  Future<DocumentSnapshot<Map<String, dynamic>>?> getUserDocument() async {
    final FirestoreService firestoreService = FirestoreService();
    final AuthService authService = AuthService();
    User? user = authService.getCurrentUser();
    if (user != null) {
      return await firestoreService.getUserDocument(user.uid);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>?>(
            future: getUserDocument(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  !snapshot.hasData ||
                  snapshot.data?.data() == null ||
                  snapshot.hasError) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else {
                final Map<String, dynamic>? userData = snapshot.data!.data();
                if (userData == null) {
                  return const Center(
                    child: Text(
                      'No data available',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                final List<dynamic>? userList = pageType == "followers"
                    ? (userData["followers"] as List<dynamic>?)
                    : (userData["following"] as List<dynamic>?);
                if (userList == null) {
                  return const Center(
                    child: Text(
                      'No followers/following available',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 32),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 64,
                      color: Colors.black,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfilePage()));
                            },
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Row(
                            children: [
                              Text(
                                "${userData["username"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Expanded(
                        child: SizedBox(
                          height: 32,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade900,
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.white60,
                                size: 24,
                              ),
                              hintText: 'Search',
                              hintStyle: const TextStyle(
                                  color: Colors.white60, fontSize: 16),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (context, index) {
                          final user = userList[index];
                          return FollowerItem(
                            imagePath: user["profilePicture"] ??
                                "assets/defaultpfp.jpg",
                            userName: user["username"] ?? "",
                            name: user["nickname"] ?? "",
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
            }));
  }
}
