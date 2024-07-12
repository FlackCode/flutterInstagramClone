import 'package:flutter/material.dart';
import 'package:flutterinstagramclone/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

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
                  height: 100,
                ),
                const MyTextfield(hintText: "Username"),
                const SizedBox(
                  height: 10,
                ),
                const MyTextfield(hintText: "Email"),
                const SizedBox(
                  height: 10,
                ),
                const MyTextfield(hintText: "Password"),
                const SizedBox(
                  height: 10,
                ),
                const MyTextfield(hintText: "Confirm password"),
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
                        "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            )),
            GestureDetector(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "I already have an account",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue.shade600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
