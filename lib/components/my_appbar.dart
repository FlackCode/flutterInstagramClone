import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 32),
      padding: const EdgeInsets.symmetric(horizontal: 8),
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
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline_rounded,
                color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
