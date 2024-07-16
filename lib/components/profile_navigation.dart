import 'package:flutter/material.dart';

class ProfileNavigation extends StatefulWidget {
  const ProfileNavigation({super.key});

  @override
  _ProfileNavigationState createState() => _ProfileNavigationState();
}

class _ProfileNavigationState extends State<ProfileNavigation> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 32),
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0), // Add padding around the text
            child: const Text(
              "Capture the moment\nwith a friend",
              textAlign: TextAlign.center, // Center the text
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0), // Add padding around the text
            child: Text(
              "Create your first post",
              textAlign: TextAlign.center, // Center the text
              style: TextStyle(
                  color: Colors.blue.shade600,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
            ),
          ),
        ],
      ),
    ),
    Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 32),
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0), // Add padding around the text
            child: const Text(
              "Share a moment\nwith the world",
              textAlign: TextAlign.center, // Center the text
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0), // Add padding around the text
            child: Text(
              "Create your first reel",
              textAlign: TextAlign.center, // Center the text
              style: TextStyle(
                  color: Colors.blue.shade600,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
            ),
          ),
        ],
      ),
    ),
    Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 32),
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0), // Add padding around the text
            child: const Text(
              "Photos and videos of you",
              textAlign: TextAlign.center, // Center the text
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0), // Add padding around the text
            child: Text(
              "When people tag you in photos and videos, they'll appear here",
              textAlign: TextAlign.center, // Center the text
              style: TextStyle(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
            ),
          ),
        ],
      ),
    ),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => onItemTapped(0),
              icon: Icon(
                Icons.grid_on_sharp,
                color: selectedIndex == 0 ? Colors.white : Colors.grey,
                size: 24,
              ),
            ),
            IconButton(
              onPressed: () => onItemTapped(1),
              icon: Icon(
                Icons.movie_outlined,
                color: selectedIndex == 1 ? Colors.white : Colors.grey,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () => onItemTapped(2),
              icon: Icon(
                Icons.photo_camera_front_outlined,
                color: selectedIndex == 2 ? Colors.white : Colors.grey,
                size: 30,
              ),
            ),
          ],
        ),
        pages[selectedIndex],
      ],
    );
  }
}
