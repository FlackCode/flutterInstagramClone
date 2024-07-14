import 'package:flutter/material.dart';
import 'package:flutterinstagramclone/components/my_navitem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(
        child: Text('Home Page', style: TextStyle(color: Colors.white))),
    const Center(
        child: Text('Search Page', style: TextStyle(color: Colors.white))),
    const Center(
        child: Text('Add Page', style: TextStyle(color: Colors.white))),
    const Center(
        child: Text('Movies Page', style: TextStyle(color: Colors.white))),
    const Center(
        child: Text('Profile Page', style: TextStyle(color: Colors.white))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyNavitem(
              icon: Icons.home,
              index: 0,
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            ),
            MyNavitem(
              icon: Icons.search,
              index: 1,
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            ),
            MyNavitem(
              icon: Icons.add_box_outlined,
              index: 2,
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            ),
            MyNavitem(
              icon: Icons.movie_outlined,
              index: 3,
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            ),
            MyNavitem(
              icon: Icons.account_circle_outlined,
              index: 4,
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 32),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: 64,
            color: Colors.black,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/instagram-text-logo.png",
                  height: 128,
                  width: 128,
                  color: Colors.white,
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.favorite_outline_rounded,
                      color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.chat_bubble_outline_rounded,
                      color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
    );
  }
}
