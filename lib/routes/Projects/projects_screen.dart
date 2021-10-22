import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/data/quick_note_list.dart';
import 'package:todo_list_app/data/project_list.dart';
import 'package:todo_list_app/models/project.dart';
import 'package:todo_list_app/widgets/color_picker.dart';

class Project extends StatefulWidget {
  const Project({Key? key}) : super(key: key);

  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  TextEditingController titleController = TextEditingController();
  int _chosenColor = 0xFF6074F9;

  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  List<ProjectModel> items = getProjectList();
  // List<ProjectModel> items = [
  //   ProjectModel('aaa', 0xFF6074F9, 0),
  //   ProjectModel('bba', 0xFF6074F9, 0)
  // ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      appBar: AppBar(
        shadowColor: Color(0xFFFFFFFF),
        backgroundColor: Color(0xFFFFFFFF),
        automaticallyImplyLeading: false,
        title: const Text(
          'Project',
          style: TextStyle(
            color: Color(0xFF313131),
            fontFamily: 'AvenirNextRoundedPro',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: getProjectData,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                child: GridView.builder(
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: items.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 26, horizontal: 26),
                        // decoration: BoxDecoration(
                        //   color: Color(0xFFFFFFFF),
                        //   borderRadius: BorderRadiusDirectional.circular(5),
                        // ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFFE0E0E0), spreadRadius: 2,
                              blurRadius: 7,
                              offset: Offset(5, 5), // Shadow position
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: Color(item.color)
                                    .withOpacity(0.25), // border color
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(6), // border width
                                child: Container(
                                  // or ClipRRect if you need to clip the content
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(item.color),
                                  ),
                                  child: Container(), // inner content
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              item.title,
                              style: const TextStyle(
                                color: Color(0xFF313131),
                                fontFamily: 'AvenirNextRoundedPro',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(item.id.toString()),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              item.tasks.toString(),
                              style: TextStyle(
                                color: Color(0xFF9A9A9A),
                                fontFamily: 'AvenirNextRoundedPro',
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              InkWell(
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadiusDirectional.circular(5)),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(24),
                            height: 400,
                            width: 327,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Title',
                                  style: TextStyle(
                                    color: Color(0xFF313131),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                TextFormField(
                                  controller: titleController,
                                  maxLines: 3,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      color: Color(0xFF313131),
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  style: const TextStyle(fontSize: 18),
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
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 51),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(327, 48),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      primary:
                                          const Color(0xFFF96060), // background
                                    ),
                                    onPressed: () {
                                      addProject();
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
                        );
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getProjectData() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      items = getProjectList();
    });
  }

  Future<void> addProject() async {
    int size = 0;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("project")
        .get()
        .then((snap) {
      size = snap.docs.length; // will return the collection size
    });
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("project")
        .doc('${size + 1}')
        .set({
          'title': titleController.text.trim(),
          'color': _chosenColor,
          'task': 0,
          'id': '${size + 1}'
        })
        .then((value) => print("Project Added"))
        .catchError((error) => print("Failed to add Project: $error"));
    Navigator.pop(context);
  }
}
