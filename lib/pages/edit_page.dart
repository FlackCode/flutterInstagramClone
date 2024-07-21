import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterinstagramclone/components/my_textfield.dart';
import 'package:flutterinstagramclone/pages/profile_page.dart';

class EditPage extends StatelessWidget {
  final Map<String, dynamic>? userData;

  EditPage({super.key, required this.userData});

  final TextEditingController nickNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

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
                Row(
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
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      child: ClipOval(
                        child: Image.asset(
                          "assets/defaultpfp.jpg",
                          width: 64,
                          height: 64,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Edit picture",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade600,
                          fontSize: 16),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                MyTextfield(hintText: "Name", controller: nickNameController),
                SizedBox(
                  height: 8,
                ),
                MyTextfield(
                    hintText: "Username", controller: userNameController),
                SizedBox(
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
