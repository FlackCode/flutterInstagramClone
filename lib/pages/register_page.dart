import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterinstagramclone/components/my_textfield.dart';
import 'package:flutterinstagramclone/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isLoading = false;

  void register(BuildContext context) async {
    final AuthService authService = AuthService();
    if (usernameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      if (passwordController.text != confirmPasswordController.text) {
        showErrorDialog(context, "Passwords do not match.");
        return;
      }
      if (usernameController.text.length < 4) {
        showErrorDialog(
            context, "Username must be at least 4 characters long.");
        return;
      }

      setState(() {
        isLoading = true;
      });

      try {
        await authService.registerWithEmailAndPass(
          emailController.text,
          passwordController.text,
          usernameController.text,
        );
      } on FirebaseAuthException catch (e) {
        showErrorDialog(context, e.message ?? "An error occurred.");
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      showErrorDialog(context, "Some fields are empty.");
    }
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 64,
              ),
              Text(
                "English (US)",
                style: TextStyle(color: Colors.grey.shade400),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/instagram-logo.png",
                      height: 64,
                      width: 64,
                    ),
                    const SizedBox(
                      height: 30,
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
                        onTap: isLoading ? null : () => register(context),
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
                    if (isLoading)
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "I already have an account",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade600),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
