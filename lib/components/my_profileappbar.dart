import 'package:flutter/material.dart';
import 'package:flutterinstagramclone/services/auth/auth_gate.dart';
import 'package:flutterinstagramclone/services/auth/auth_service.dart';

class MyProfileappbar extends StatelessWidget {
  final String userName;
  const MyProfileappbar({super.key, required this.userName});

  void signOut(BuildContext context) async {
    final AuthService authService = AuthService();
    await authService.signOut();
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AuthGate()));
  }

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
          Row(
            children: [
              Text(
                userName,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white),
              ),
              const Icon(
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
                onPressed: () => signOut(context),
              ),
            ],
          )
        ],
      ),
    );
  }
}
