import 'package:flutter/material.dart';
import 'package:flutterinstagramclone/components/my_textfield.dart';
import 'package:flutterinstagramclone/pages/profile_page.dart';
import 'package:flutterinstagramclone/services/firestore/firestore_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class EditPage extends StatefulWidget {
  final Map<String, dynamic>? userData;
  final String userID;

  EditPage({super.key, required this.userData, required this.userID});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController nickNameController = TextEditingController();
  late TextEditingController userNameController = TextEditingController();
  late TextEditingController bioController = TextEditingController();
  late String profilePictureURL = '';
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    nickNameController =
        TextEditingController(text: widget.userData?['nickname'] ?? '');
    userNameController =
        TextEditingController(text: widget.userData?['username'] ?? '');
    bioController = TextEditingController(text: widget.userData?['bio'] ?? '');
    profilePictureURL =
        widget.userData?['profilePictureURL'] ?? 'assets/defaultpfp.jpg';
  }

  void saveInfo(BuildContext context) async {
    final FirestoreService firestoreService = FirestoreService();
    if (nickNameController.text == widget.userData?["nickname"] &&
        userNameController.text == widget.userData?["username"] &&
        bioController.text == widget.userData?["bio"] &&
        profilePictureURL == widget.userData?['profilePictureURL']) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: const Text(
            "No changes detected, not saving.",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    } else {
      try {
        await firestoreService.saveEditedUserData(
            nickNameController.text,
            userNameController.text,
            bioController.text,
            profilePictureURL,
            widget.userID);
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfilePage()));
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            title: const Text(
              "Failed to save changes.",
              style: TextStyle(color: Colors.white),
            ),
            content: Text(
              e.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    }
  }

  Future<void> editPicture(BuildContext context) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File file = File(pickedFile.path);
      try {
        final storageRef = FirebaseStorage.instance
            .ref()
            .child("profilePictures/${widget.userID}.jpg");
        final uploadTask = storageRef.putFile(file);
        final snapshot = await uploadTask;
        final downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          profilePictureURL = downloadUrl;
        });
        saveInfo(context);
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 32),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 64,
            color: Colors.black,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                ),
                const SizedBox(
                  width: 16,
                ),
                const Row(
                  children: [
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                    onPressed: () => saveInfo(context),
                    icon: Icon(
                      Icons.check,
                      color: Colors.blue.shade600,
                      size: 28,
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  ClipOval(
                    child: Image.network(
                      profilePictureURL,
                      width: 64,
                      height: 64,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/defaultpfp.jpg",
                          width: 64,
                          height: 64,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () => editPicture(context),
                    child: Text(
                      "Edit picture",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade600,
                          fontSize: 16),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                MyTextfield(hintText: "Name", controller: nickNameController),
                const SizedBox(
                  height: 8,
                ),
                MyTextfield(
                    hintText: "Username", controller: userNameController),
                const SizedBox(
                  height: 8,
                ),
                MyTextfield(hintText: "Bio", controller: bioController),
              ],
            ),
          )
        ],
      ),
    );
  }
}
