import 'package:flutter/material.dart';
import 'package:flutterinstagramclone/pages/home_page.dart';

class MessagesAppbar extends StatelessWidget {
  const MessagesAppbar({super.key});

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
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
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
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              )
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.edit_square, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
