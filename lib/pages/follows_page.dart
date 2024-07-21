import 'package:flutter/material.dart';
import 'package:flutterinstagramclone/components/follower_item.dart';
import 'package:flutterinstagramclone/pages/profile_page.dart';

class FollowsPage extends StatelessWidget {
  final String pageType;

  const FollowsPage({super.key, required this.pageType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
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
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
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
                const Row(
                  children: [
                    Text(
                      "flack",
                      style: TextStyle(
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
                    hintStyle:
                        const TextStyle(color: Colors.white60, fontSize: 16),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
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
          const FollowerItem(
              imagePath: "assets/defaultpfp.jpg",
              name: "test",
              userName: "test.user")
        ],
      ),
    );
  }
}
