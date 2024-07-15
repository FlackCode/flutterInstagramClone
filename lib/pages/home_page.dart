import 'package:flutter/material.dart';
import 'package:flutterinstagramclone/components/my_appbar.dart';
import 'package:flutterinstagramclone/components/my_navbar.dart';
import 'package:flutterinstagramclone/components/stories_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: MyNavbar(),
      body: Column(
        children: [
          MyAppbar(),
          StoriesComponent()
        ],
      ),
    );
  }
}
