import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list_app/widgets/color_picker.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController descriptionController = TextEditingController();
  int _chosenColor = 0xFF6074F9;

  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.west),
        title: Text('Add Note'),
        titleTextStyle: const TextStyle(
          fontFamily: 'AvenirNextRoundedPro',
          fontSize: 20,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF96060),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: 44,
              color: const Color(0xFFF96060),
            ),
            // Positioned(left: 0, right: 0, bottom: 0, child: Tabs()),
            Container(
              // width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height * 0.85,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  color: Colors.white),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.fromLTRB(24, 24, 11, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: const Text(
                          'Description',
                          style: TextStyle(
                              color: Color(0xFF313131),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          controller: descriptionController,
                          maxLines: 7,
                          decoration: const InputDecoration(
                            hintText: 'Enter your description',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Color(0xFF313131),
                              // fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      const Text(
                        'Choose Color',
                        style: TextStyle(
                            color: Color(0xFF313131),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 17),
                        child: ColorPicker(
                          onSelectColor: (value) {
                            setState(() {
                              _chosenColor = value;
                            });
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 51),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(327, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            primary: const Color(0xFFF96060), // background
                          ),
                          onPressed: () {
                            addNote();
                          },
                          child: const Text(
                            'Done',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addNote() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("quick_note")
        .add({
          'task': descriptionController.text.trim(),
          'color': _chosenColor,
          'type': 'Quick Note',
        })
        .then((value) => print("Quick Note Added"))
        .catchError((error) => print("Failed to add Quick Note: $error"));
    ;
    Navigator.pop(context);
  }
}
