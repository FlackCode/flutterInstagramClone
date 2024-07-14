import 'package:flutter/material.dart';

class MyNavitem extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const MyNavitem({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Icon(
          icon,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
