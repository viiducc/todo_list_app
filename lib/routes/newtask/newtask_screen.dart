import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/routes/newtask/widget/due_date.dart';
import 'package:todo_list_app/routes/newtask/widget/due_time.dart';
import 'package:todo_list_app/routes/tabs/tabs.dart';

class NewTask extends StatefulWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final User? user = FirebaseAuth.instance.currentUser;
  String link = '';
  String _projectValue = '', _projectId = '';
  DateTime? _myDate = null;
  TimeOfDay? _myTime = null;
  List<String> member = [];
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.west),
        title: Text('New Task'),
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
            Positioned(
              bottom: 0,
              child: Container(
                width: size.width,
                color: const Color(0xFF292E4E),
                height: 90,
              ),
            ),
            SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.85,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    color: Colors.white),
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'For',
                            style: TextStyle(
                              color: Color(0xFF313131),
                              fontFamily: 'AvenirNextRoundedPro',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.all(14),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                              color: Color(0xFFF4F4F4),
                            ),
                            child: Text(
                              user!.displayName.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          const Text(
                            'In',
                            style: TextStyle(
                              color: Color(0xFF313131),
                              fontFamily: 'AvenirNextRoundedPro',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.all(14),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                              color: Color(0xFFF4F4F4),
                            ),
                            // child: const Text(
                            //   'Project',
                            //   style: TextStyle(
                            //     color: Color(0xFF313131),
                            //     fontFamily: 'AvenirNextRoundedPro',
                            //     fontSize: 14,
                            //   ),
                            // ),
                            child: InkWell(
                              onTap: () {
                                openProjectDialog(user!, setProjectValue);
                              },
                              child: Center(
                                  child: Text(
                                _projectValue == '' ? 'Project' : _projectValue,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        height: 66,
                        color: const Color(0xFFF4F4F4),
                        padding: const EdgeInsets.all(24),
                        child: TextFormField(
                          controller: _titleController,
                          decoration: const InputDecoration(
                            hintText: 'Title',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Color(0xFF313131),
                              fontFamily: 'AvenirNextRoundedPro',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          style: const TextStyle(
                              fontFamily: 'AvenirNextRoundedPro', fontSize: 18),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(24),
                        child: const Text(
                          'Description',
                          style: TextStyle(
                            color: Color(0xFF9E9E9E),
                            fontFamily: 'AvenirNextRoundedPro',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        //padding: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color(0xFFEAEAEA),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              // height: 75,
                              child: TextFormField(
                                maxLines: 3,
                                cursorColor: Color(0xFFEAEAEA),
                                // decoration: InputDecoration(
                                //   border: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(5),
                                //       borderSide: const BorderSide(
                                //           color: Color(0xFFEAEAEA))),
                                // ),
                              ),
                            ),
                            Container(
                              height: 48,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              color: const Color(0xFFF8F8F8),
                              child: Row(
                                children: const [
                                  Icon(Icons.attach_file),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      DueDate(
                        date: _myDate,
                        press: setDate,
                      ),
                      // DueTime(
                      //   time: _myTime,
                      //   press: setTime,
                      // ),
                      SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.only(left: 24),
                        child: const Text(
                          'Add Member',
                          style: TextStyle(
                              color: Color(0xFF313131),
                              fontFamily: 'AvenirNextRoundedPro',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(28, 8, 0, 36),
                        padding: const EdgeInsets.all(14),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          color: Color(0xFFF4F4F4),
                        ),
                        child: const Text(
                          'Anyone',
                          style: TextStyle(
                            color: Color(0xFF313131),
                            fontFamily: 'AvenirNextRoundedPro',
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(327, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            primary: const Color(0xFFF96060), // background
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Add Task',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontFamily: 'AvenirNextRoundedPro',
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

  Future<void> openProjectDialog(User user, Function press) async =>
      await showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(user.uid)
                .collection('project')
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                List<QueryDocumentSnapshot<Object?>> data = snapshot.data!.docs;
                return SimpleDialog(
                  backgroundColor: Color(0xFFF4F4F4),
                  contentPadding: EdgeInsets.all(0),
                  children: [
                    for (int i = 0; i < data.length; i++)
                      SimpleDialogOption(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            data[i]['title'].toString(),
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        onPressed: () {
                          press(data[i]['title'].toString(),
                              data[i]['id'].toString());
                          Navigator.pop(context);
                        },
                      ),
                  ],
                );
              }
              return Container(
                color: Colors.white,
                child: Center(
                  child: Image.asset("assets/images/splash/splash.svg"),
                ),
              );
            },
          );
        },
      );
  void setDate(date) {
    setState(() {
      _myDate = date;
    });
  }

  void setTime(time) {
    setState(() {
      _myTime = time;
    });
  }

  void setProjectValue(String title, String id) {
    setState(() {
      _projectValue = title;
      _projectId = id;
    });
  }
}
