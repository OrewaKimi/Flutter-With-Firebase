import 'package:flutter/material.dart';
import 'package:flutterfirebase/services/firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: const Icon(Icons.add),
      ),
    );
  }

  // firestore service
  final FirestoreService firestoreService = FirestoreService();

  // text contoller
  final TextEditingController textController = TextEditingController();

  // open a dialog vox to add a note
  void openNoteBox() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // text user input
        content: TextField(
          controller: textController,
          ),
          actions: [
            // button to save
            ElevatedButton(
              onPressed: () {
                // add a new note
                firestoreService.addNote(textController.text);

                // clear the text controller
                textController.clear();

                // close the dialog
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      );
  }
}