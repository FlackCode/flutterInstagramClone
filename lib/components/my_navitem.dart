import 'package:flutter/material.dart';

class MyNavitem extends StatelessWidget {
  final IconData icon;
  final int index;
  final int selectedIndex;
  final void Function(int)? onItemTapped;

  const MyNavitem(
      {super.key,
      required this.icon,
      required this.index,
      required this.selectedIndex,
      required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onItemTapped!(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Icon(
          icon,
          color: selectedIndex == index ? Colors.white : Colors.grey,
          size: 28,
        ),
      ),
    );
  }
}
