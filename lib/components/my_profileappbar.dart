import 'package:flutter/material.dart';

class MyProfileappbar extends StatelessWidget {
  const MyProfileappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 32),
      padding: const EdgeInsets.only(left: 16, right: 8),
      height: 64,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.alternate_email, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.add_box_outlined,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 32,
                ),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
