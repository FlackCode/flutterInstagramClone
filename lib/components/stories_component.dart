import 'package:flutter/material.dart';
import 'package:flutterinstagramclone/components/story_item.dart';

class StoriesComponent extends StatelessWidget {
  const StoriesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      margin: const EdgeInsets.only(left: 16, bottom: 4),
      child: SizedBox(
        height: 89,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                children: [
                  Stack(
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
                            "assets/defaultpfp.jpg",
                            width: 64,
                            height: 64,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        right: 2,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                              border:
                                  Border.all(color: Colors.black, width: 2)),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Your story",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              );
            } else {
              return const StoryItem(
                imagePath: "assets/defaultpfp.jpg",
                name: "Story",
              );
            }
          },
        ),
      ),
    );
  }
}
