import 'package:flutter/material.dart';
import 'package:flutterinstagramclone/components/my_textfield.dart';
import 'package:flutterinstagramclone/services/auth/auth_service.dart';

class RegisterPage extends StatelessWidget {
  void Function()? onTap;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context) async {
    final AuthService authService = AuthService();
    if (usernameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      try {
        if (passwordController.text == confirmPasswordController.text &&
            usernameController.text.length > 4) {
          await authService.registerWithEmailAndPass(emailController.text,
              usernameController.text, usernameController.text);
        }
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                title: const Text("Some fields are empty."),
              ));
    }
  }

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
                MyTextfield(
                  hintText: "Username",
                  controller: usernameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextfield(
                  hintText: "Email",
                  controller: emailController,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextfield(
                  hintText: "Password",
                  obscureText: true,
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextfield(
                  hintText: "Confirm password",
                  obscureText: true,
                  controller: confirmPasswordController,
                ),
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
                  child: GestureDetector(
                    onTap: () => register(context),
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
                ),
              ],
            )),
            const SizedBox(
              height: 60,
            ),
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
