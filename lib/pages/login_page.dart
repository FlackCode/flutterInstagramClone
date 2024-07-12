import 'package:flutter/material.dart';
import 'package:flutterinstagramclone/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 64,
            ),
            Text(
              "English (US)",
              style: TextStyle(color: Colors.grey.shade400),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/instagram-logo.png",
                    height: 64,
                    width: 64,
                  ),
                  const SizedBox(
                    height: 130,
                  ),
                  const MyTextfield(hintText: "Email"),
                  const SizedBox(
                    height: 10,
                  ),
                  const MyTextfield(hintText: "Password"),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 18,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.blue.shade700),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Center(
                        child: Text(
                          "Log in",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            // Text at the bottom
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 18,
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.blue.shade600, width: 1.5),
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.transparent),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Center(
                      child: Text(
                        "Create new account",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.blue.shade600,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  "assets/meta.png",
                  width: 48,
                  height: 48,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
