import 'package:flutter/material.dart';
import 'package:flutterinstagramclone/components/messages_appbar.dart';
import 'package:flutterinstagramclone/components/notes_component.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const MessagesAppbar(),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade900,
                prefixIcon: const Icon(Icons.search, color: Colors.black),
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.white60, fontSize: 18),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const NotesComponent(),
          const SizedBox(
            height: 16,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Messages",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(
                  "Requests",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
