import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  final String imagePath;
  final String name;

  const StoryItem({super.key, required this.imagePath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 24,
        ),
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
              ),
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              name,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            )
          ],
        ),
      ],
    );
  }
}
