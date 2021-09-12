import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:todo_list_app/routes/SignIn/signin_screen.dart';

class InfoUser extends StatefulWidget {
  const InfoUser({
    Key? key,
  }) : super(key: key);

  @override
  _InfoUserState createState() => _InfoUserState();
}

class _InfoUserState extends State<InfoUser> {
  String link = '';
  final ImagePicker _picker = ImagePicker();
  final String? _email = FirebaseAuth.instance.currentUser!.email;
  final String? _name = FirebaseAuth.instance.currentUser!.displayName;
  final User? user = FirebaseAuth.instance.currentUser;
  bool _noneAvatar = true;
  int _createTask = 0;
  int _completedTask = 0;

  Future<void> loadTask() async {
    // quick note length
    int completed = 0;
    int taskLength = 0;
    await FirebaseFirestore.instance.collection('project').get().then((snap) {
      for (int i = 0; i < snap.docs.length; i++) {
        final listID = snap.docs.asMap()[i]!['member'];
        listID.add(snap.docs.asMap()[i]!['for']);
        if (listID.contains(user!.uid)) {
          taskLength++;
          if (snap.docs.asMap()[i]!['status'] == 1) {
            completed++;
          }
        }
      } // will return the collection size
    });
    setState(() {
      _createTask = taskLength;
      _completedTask = completed;
    });
  }

  void checkAvatar() {
    if (user != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        bool _checkNoneAvatar;
        if (documentSnapshot.get('avatar') != '' && _noneAvatar == true)
          _checkNoneAvatar = true;
        else
          _checkNoneAvatar = false;
        setState(() {
          _noneAvatar = _checkNoneAvatar;
        });
      });
    }
  }

  void takePhoto(ImageSource source) async {
    // ignore: deprecated_member_use
    final pickedFile = await _picker.getImage(source: source);
    if (pickedFile!.path != '') {
      uploadFile(pickedFile.path);
      loadAvatar();
      checkAvatar();
    }
  }

  Future<void> uploadFile(String filePath) async {
    File file = File(filePath);
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('users/avatar/${user!.uid}.png')
          .putFile(file);
      loadAvatar();
      checkAvatar();
      // ignore: unused_catch_clause
    } on firebase_core.FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
    }
  }

  Future<void> loadAvatar() async {
    String _link = await firebase_storage.FirebaseStorage.instance
        .ref('users/avatar/${user!.uid}.png')
        .getDownloadURL();
    if (link != _link) {
      setState(() {
        link = _link;
      });
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .update({'avatar': _link});
      loadAvatar();
      checkAvatar();
    }
  }

  @override
  void initState() {
    loadAvatar();
    loadTask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    checkAvatar();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        padding: const EdgeInsets.fromLTRB(23, 10, 10, 29),
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
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 14.0,
                  left: 14,
                ),
                child: Container(
                  width: size.width * .15,
                  height: size.width * .15,
                  child: Stack(
                    children: <Widget>[
                      _noneAvatar
                          ? link != ''
                              ? CircleAvatar(
                                  radius: 80.0,
                                  backgroundImage: NetworkImage(
                                    '$link',
                                  ),
                                )
                              : const CircleAvatar(
                                  backgroundColor: Color(0xFFF96060),
                                  foregroundColor: Colors.white,
                                  radius: 25,
                                  child: Icon(
                                    Icons.account_circle,
                                    size: 50,
                                  ))
                          : const CircleAvatar(
                              backgroundColor: Color(0xFFF96060),
                              foregroundColor: Colors.white,
                              radius: 25,
                              child: Icon(
                                Icons.account_circle,
                                size: 50,
                              )),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            showBottomSheet(
                              context: context,
                              builder: ((builder) => bottomSheet(context)),
                            );
                          },
                          child: Icon(
                            Icons.camera_alt,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _name!,
                    style: TextStyle(
                        height: 2,
                        color: Color(0xFF313131),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    _email!,
                    style: const TextStyle(
                        height: 2, color: Color(0xFF9A9A9A), fontSize: 16),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    logOut();
                  },
                  icon: const Icon(
                    Icons.logout,
                    size: 30,
                  ))
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 23, top: 30),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _createTask.toString(),
                        style: TextStyle(
                            height: 2,
                            color: Color(0xFF313131),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text(
                        'Create Tasks',
                        style: TextStyle(
                            height: 2, color: Color(0xFF9A9A9A), fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 53,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _completedTask.toString(),
                        style: TextStyle(
                            height: 2,
                            color: Color(0xFF313131),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text(
                        'Completed Tasks',
                        style: TextStyle(
                            height: 2, color: Color(0xFF9A9A9A), fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 160,
      width: size.width,
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              "Choose Profile photo",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        takePhoto(ImageSource.camera);
                      },
                      icon: Icon(Icons.camera),
                    ),
                    Text("Camera"),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        takePhoto(ImageSource.gallery);
                      },
                      icon: Icon(Icons.image),
                    ),
                    Text("Gallery"),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> logOut() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text(
            'Are you sure?',
            style: TextStyle(
                height: 2,
                color: Color(0xFF313131),
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          content: const Text(
            'You will be redirected to login ',
            style: TextStyle(height: 2, color: Color(0xFF313131), fontSize: 18),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF96060))),
              // color: Color(0xFFF96060))),
              onPressed: () async {
                //Log out user Firebase
                await FirebaseAuth.instance.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignIn()));
              },
            ),
            TextButton(
              child: const Text('No',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              onPressed: () {
                Navigator.of(context).pop(); //Dismiss the Dialog
              },
            ),
          ],
        );
      },
    );
  }
}
