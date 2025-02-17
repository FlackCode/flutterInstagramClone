import 'package:flutter/material.dart';
import 'package:flutterinstagramclone/pages/messages_page.dart';
import 'package:flutterinstagramclone/pages/notification_page.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 64,
      color: Colors.black,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/instagram-text-logo.png",
            height: 116,
            width: 116,
            color: Colors.white,
          ),
          const Spacer(),
          IconButton(
            icon:
                const Icon(Icons.favorite_outline_rounded, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NotificationPage()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline_rounded,
                color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MessagesPage()));
            },
          ),
        ],
      ),
    );
  }
}
