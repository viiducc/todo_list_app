import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list_app/models/check_list_model.dart';
import 'package:todo_list_app/models/note_model.dart';
import 'package:todo_list_app/models/quick_note.dart';

var quickNoteList = <QuickNote>[];
List<QuickNote> getQuickNoteList() {
  FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('quick_note')
      .get()
      .then((QuerySnapshot querySnapshot) {
    quickNoteList = [];
    querySnapshot.docs.forEach((doc) {
      doc["type"] == 'Quick Note'
          ? quickNoteList.add(Note(doc["task"], doc["color"]))
          : quickNoteList
              .add(CheckList(doc["title"], doc["color"], doc["length"]));
    });
  });
  return quickNoteList;
}
