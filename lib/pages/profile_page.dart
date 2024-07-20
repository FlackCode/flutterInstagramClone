import 'package:flutter/material.dart';
import 'package:flutterinstagramclone/components/my_navbar.dart';
import 'package:flutterinstagramclone/components/my_profileappbar.dart';
import 'package:flutterinstagramclone/components/my_profilebutton.dart';
import 'package:flutterinstagramclone/components/profile_navigation.dart';
import 'package:flutterinstagramclone/pages/follows_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: const MyNavbar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const MyProfileappbar(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
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
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              const Column(
                                children: [
                                  Text(
                                    "0",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "posts",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
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
                                          builder: (context) => const FollowsPage(
                                              pageType: "followers")));
                                },
                                child: const Column(
                                  children: [
                                    Text(
                                      "17",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "followers",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
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
                                          builder: (context) => const FollowsPage(
                                              pageType: "followers")));
                                },
                                child: const Column(
                                  children: [
                                    Text(
                                      "19",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "following",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
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
                    margin: const EdgeInsets.only(left: 16, top: 4, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "flack",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const Text(
                          "coding...",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          child: Row(
                            children: [
                              const MyProfilebutton(text: "Edit profile"),
                              const SizedBox(
                                width: 10,
                              ),
                              const MyProfilebutton(text: "Share profile"),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade800,
                                    borderRadius: BorderRadius.circular(8)),
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
                                            color: Colors.white, width: 1)),
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
                                        fontSize: 14, color: Colors.white),
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
        ));
  }
}
