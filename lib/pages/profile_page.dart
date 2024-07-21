import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterinstagramclone/components/my_navbar.dart';
import 'package:flutterinstagramclone/components/my_profileappbar.dart';
import 'package:flutterinstagramclone/components/my_profilebutton.dart';
import 'package:flutterinstagramclone/components/profile_navigation.dart';
import 'package:flutterinstagramclone/pages/edit_page.dart';
import 'package:flutterinstagramclone/pages/follows_page.dart';
import 'package:flutterinstagramclone/services/auth/auth_service.dart';
import 'package:flutterinstagramclone/services/firestore/firestore_service.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  Future<DocumentSnapshot<Map<String, dynamic>>?> getUserDocument() async {
    final FirestoreService firestoreService = FirestoreService();
    final AuthService authService = AuthService();
    User? user = authService.getCurrentUser();
    return await firestoreService.getUserDocument(user!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: const MyNavbar(),
        body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>?>(
          future: getUserDocument(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else {
              final Map<String, dynamic>? userData = snapshot.data!.data();
              return SingleChildScrollView(
                child: Column(
                  children: [
                    MyProfileappbar(
                      userName: userData?['username'],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                child: ClipOval(
                                  child: Image.asset(
                                    "assets/defaultpfp.jpg",
                                    width: 96,
                                    height: 96,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "${userData?["posts"].length}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        const Text(
                                          "posts",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 32,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const FollowsPage(
                                                        pageType:
                                                            "followers")));
                                      },
                                      child: Column(
                                        children: [
                                          Text(
                                            "${userData?["followers"].length}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                          const Text(
                                            "followers",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 32,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const FollowsPage(
                                                        pageType:
                                                            "followers")));
                                      },
                                      child: Column(
                                        children: [
                                          Text(
                                            "${userData?["following"].length}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                          const Text(
                                            "following",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 16, top: 4, right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (() {
                                  final nickname = userData?["nickname"];
                                  final username = userData?["username"];
                                  return (nickname == null || nickname.isEmpty)
                                      ? username
                                      : nickname;
                                })(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Text(
                                (() {
                                  final bio = userData?["bio"];
                                  return (bio == null || bio.isEmpty)
                                      ? ""
                                      : bio;
                                })(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                child: Row(
                                  children: [
                                    MyProfilebutton(
                                      text: "Edit profile",
                                      onTap: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => EditPage(
                                                      userData: userData,
                                                    )));
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    MyProfilebutton(
                                      text: "Share profile",
                                      onTap: () {},
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade800,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.person_add_outlined,
                                            color: Colors.white,
                                          ),
                                          padding: EdgeInsets.zero,
                                          iconSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 16),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 1)),
                                          padding: const EdgeInsets.all(20),
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        const Text(
                                          "New",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                child: const ProfileNavigation(),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }
          },
        ));
  }
}
