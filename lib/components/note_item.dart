import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String? note;

  const NoteItem({
    super.key,
    required this.imagePath,
    required this.name,
    this.note,
  });

  String formatNote() {
    if (note?.isNotEmpty == true) {
      String newNote =
          note!.length > 30 ? "${note!.substring(0, 30)}..." : note!;
      return newNote.replaceAllMapped(
          RegExp('.{10}'), (match) => '${match.group(0)}\n');
    } else {
      return "Add a note";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    imagePath,
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                name,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          Positioned(
            bottom: 66,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 80,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.shade900,
                ),
                child: Text(
                  formatNote(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
