import 'package:flutter/material.dart';
import 'package:flutterinstagramclone/components/notification_item.dart';
import 'package:flutterinstagramclone/pages/home_page.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 32),
            height: 64,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                const SizedBox(
                  width: 16,
                ),
                const Text(
                  "Notifications",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  NotificationItem(
                    notificationType: "story",
                    name: "username1234",
                    name2: "username5678",
                    imagePath: "assets/defaultpfp.jpg",
                    imagePath2: "assets/defaultpfp.jpg",
                    timeStamp: "4h",
                    postPreviewPath: "assets/placeholder.webp",
                  ),
                  Text(
                    "Last 7 Days",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  //Implement listview builder eventually
                  NotificationItem(
                    notificationType: "follow",
                    name: "username6969",
                    name2: "username0420",
                    imagePath: "assets/defaultpfp.jpg",
                    imagePath2: "assets/defaultpfp.jpg",
                    timeStamp: "6d",
                    postPreviewPath: "assets/placeholder.webp",
                  ),
                  Text(
                    "Last 30 Days",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  NotificationItem(
                    notificationType: "post",
                    name: "username0000",
                    name2: "username0001",
                    imagePath: "assets/defaultpfp.jpg",
                    imagePath2: "assets/defaultpfp.jpg",
                    timeStamp: "8d",
                    postPreviewPath: "assets/placeholder.webp",
                  ),
                  NotificationItem(
                    notificationType: "post",
                    name: "username0000",
                    name2: "username0001",
                    imagePath: "assets/defaultpfp.jpg",
                    imagePath2: "assets/defaultpfp.jpg",
                    timeStamp: "8d",
                    postPreviewPath: "assets/placeholder.webp",
                  ),
                  NotificationItem(
                    notificationType: "post",
                    name: "username0000",
                    name2: "username0001",
                    imagePath: "assets/defaultpfp.jpg",
                    imagePath2: "assets/defaultpfp.jpg",
                    timeStamp: "8d",
                    postPreviewPath: "assets/placeholder.webp",
                  ),
                  NotificationItem(
                    notificationType: "post",
                    name: "username0000",
                    name2: "username0001",
                    imagePath: "assets/defaultpfp.jpg",
                    imagePath2: "assets/defaultpfp.jpg",
                    timeStamp: "8d",
                    postPreviewPath: "assets/placeholder.webp",
                  ),
                  NotificationItem(
                    notificationType: "post",
                    name: "username0000",
                    name2: "username0001",
                    imagePath: "assets/defaultpfp.jpg",
                    imagePath2: "assets/defaultpfp.jpg",
                    timeStamp: "8d",
                    postPreviewPath: "assets/placeholder.webp",
                  ),
                  NotificationItem(
                    notificationType: "post",
                    name: "username0000",
                    name2: "username0001",
                    imagePath: "assets/defaultpfp.jpg",
                    imagePath2: "assets/defaultpfp.jpg",
                    timeStamp: "8d",
                    postPreviewPath: "assets/placeholder.webp",
                  ),
                  NotificationItem(
                    notificationType: "post",
                    name: "username0000",
                    name2: "username0001",
                    imagePath: "assets/defaultpfp.jpg",
                    imagePath2: "assets/defaultpfp.jpg",
                    timeStamp: "8d",
                    postPreviewPath: "assets/placeholder.webp",
                  ),
                  NotificationItem(
                    notificationType: "post",
                    name: "username0000",
                    name2: "username0001",
                    imagePath: "assets/defaultpfp.jpg",
                    imagePath2: "assets/defaultpfp.jpg",
                    timeStamp: "8d",
                    postPreviewPath: "assets/placeholder.webp",
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
