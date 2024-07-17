import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  final String name;
  final String imagePath;
  final String viewStatus;

  const MessageItem(
      {super.key,
      required this.imagePath,
      required this.name,
      required this.viewStatus});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipOval(
              child: Image.asset(
                imagePath,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                Text(
                  viewStatus,
                  style: const TextStyle(color: Colors.white60, fontSize: 14),
                )
              ],
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.photo_camera_outlined,
                  color: Colors.white60,
                ))
          ],
        )
      ],
    );
  }
}
