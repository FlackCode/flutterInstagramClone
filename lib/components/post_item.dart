import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ClipOval(
                  child: Image.asset(
                    "assets/defaultpfp.jpg",
                    width: 32,
                    height: 32,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'flack',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '2w',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 24,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            return SizedBox(
              width: width,
              height: width,
              child: Image.asset(
                "assets/placeholder.webp",
                fit: BoxFit.cover,
              ),
            );
          },
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
              SizedBox(width: 16),
              Icon(
                Icons.chat_bubble_outline,
                color: Colors.white,
              ),
              SizedBox(width: 16),
              Icon(
                Icons.send_outlined,
                color: Colors.white,
              ),
              Spacer(),
              Icon(
                Icons.bookmark_border,
                color: Colors.white,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
          child: Text(
            '100 likes',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  'flack',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Test caption woooooo",
                  style: TextStyle(color: Colors.white),
                )
              ],
            )),
        const SizedBox(
          height: 4,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'View all 10 comments',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
