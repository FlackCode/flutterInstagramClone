import 'package:flutter/material.dart';
import 'package:flutterinstagramclone/components/my_navitem.dart';
import 'package:flutterinstagramclone/pages/home_page.dart';
import 'package:flutterinstagramclone/pages/profile_page.dart';

class MyNavbar extends StatelessWidget {
  const MyNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyNavitem(
            icon: Icons.home,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          MyNavitem(
            icon: Icons.search,
            onTap: () {},
          ),
          MyNavitem(
            icon: Icons.add_box_outlined,
            onTap: () {},
          ),
          MyNavitem(
            icon: Icons.movie_outlined,
            onTap: () {},
          ),
          MyNavitem(
            icon: Icons.account_circle_outlined,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
          )
        ],
      ),
    );
  }
}
