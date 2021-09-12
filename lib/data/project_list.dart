import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list_app/models/project.dart';

var projectList = <ProjectModel>[];
List<ProjectModel> getProjectList() {
  FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('project')
      .get()
      .then((QuerySnapshot querySnapshot) {
    projectList = [];
    querySnapshot.docs.forEach((doc) {
      projectList.add(ProjectModel(doc["title"], doc["color"], doc["task"]));
    });
  });
  return projectList;
}
