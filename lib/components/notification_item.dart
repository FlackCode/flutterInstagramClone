import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final String notificationType;
  final String name;
  final String name2;
  final String imagePath;
  final String imagePath2;
  final String timeStamp;
  final String postPreviewPath;

  const NotificationItem(
      {super.key,
      required this.notificationType,
      required this.name,
      required this.name2,
      required this.imagePath,
      required this.imagePath2,
      required this.timeStamp,
      required this.postPreviewPath});

  @override
  Widget build(BuildContext context) {
    if (notificationType == "story") {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            SizedBox(
              width: 48,
              height: 48,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/defaultpfp.jpg",
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(16)),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/defaultpfp.jpg",
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "$name, $name2",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text: " and others liked your story",
                      style: TextStyle(color: Colors.white, height: 1.3),
                    ),
                    TextSpan(
                        text: " $timeStamp",
                        style:
                            const TextStyle(color: Colors.white60, height: 1.3))
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/placeholder.webp",
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      );
    } else if (notificationType == "post") {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            SizedBox(
              width: 48,
              height: 48,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/defaultpfp.jpg",
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(16)),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/defaultpfp.jpg",
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "$name, $name2",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text: " and others liked your post",
                      style: TextStyle(color: Colors.white, height: 1.3),
                    ),
                    TextSpan(
                        text: " $timeStamp",
                        style:
                            const TextStyle(color: Colors.white60, height: 1.3))
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/placeholder.webp",
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            SizedBox(
              width: 48,
              height: 48,
              child: ClipOval(
                child: Image.asset(
                  "assets/defaultpfp.jpg",
                  width: 48,
                  height: 48,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text: " started following you.",
                      style: TextStyle(color: Colors.white, height: 1.3),
                    ),
                    TextSpan(
                        text: " $timeStamp",
                        style:
                            const TextStyle(color: Colors.white60, height: 1.3))
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 100,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              decoration: BoxDecoration(
                  color: Colors.blue.shade600,
                  borderRadius: BorderRadius.circular(4)),
              child: const Center(
                child: Text(
                  "Follow",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      );
    }
  }
}
