import 'package:flutter/material.dart';
import 'package:flutterinstagramclone/components/note_item.dart';

class NotesComponent extends StatelessWidget {
  const NotesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.only(left: 24),
              child: NoteItem(
                imagePath: "assets/defaultpfp.jpg",
                name: "Your note",
                note: "",
              ),
            );
          } else {
            return const Padding(
              padding: EdgeInsets.only(left: 24),
              child: NoteItem(
                imagePath: "assets/defaultpfp.jpg",
                name: "test",
                note:
                    "This is a test note to see how it looks above the profile picture.",
              ),
            );
          }
        },
      ),
    );
  }
}
