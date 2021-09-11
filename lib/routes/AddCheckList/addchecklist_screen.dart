import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list_app/models/check_list_model.dart';
import 'package:todo_list_app/models/note_model.dart';
import 'package:todo_list_app/routes/tabs/tabs.dart';
import 'package:todo_list_app/widgets/color_picker.dart';

class AddCheckList extends StatefulWidget {
  const AddCheckList({Key? key}) : super(key: key);

  @override
  _AddCheckListState createState() => _AddCheckListState();
}

class _AddCheckListState extends State<AddCheckList> {
  TextEditingController titleController = TextEditingController();
  int _chosenColor = 0xFF6074F9;
  bool checked = false;
  List<int> selectedList = [];
  int indexCheckItem = 4;
  List<TextEditingController> _listItemController = [
    for (int i = 0; i < 10; i++) TextEditingController(),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.west),
        title: Text(
          'Add Check List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
                          'Title',
                          style: TextStyle(
                              color: Color(0xFF313131),
                              fontFamily: 'AvenirNextRoundedPro',
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          controller: titleController,
                          maxLines: 2,
                          decoration: const InputDecoration(
                            hintText: 'Enter your title check list',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Color(0xFF313131),
                              fontFamily: 'AvenirNextRoundedPro',
                              // fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          style: const TextStyle(
                              fontFamily: 'AvenirNextRoundedPro', fontSize: 18),
                        ),
                      ),
                      for (int i = 0; i < indexCheckItem; i++)
                        CheckItem(
                          index: i,
                          controller: _listItemController[i],
                        ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (indexCheckItem < 10) indexCheckItem++;
                              });
                            },
                            child: const Text(
                              "+ Add new item",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (indexCheckItem > 1) indexCheckItem--;
                              });
                            },
                            child: const Text(
                              "Remove item",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Choose Color',
                        style: TextStyle(
                            color: Color(0xFF313131),
                            fontFamily: 'AvenirNextRoundedPro',
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
                          onPressed: AddCheckList,
                          child: const Text(
                            'Done',
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

  void AddCheckList() {
    List<Item> listItem = <Item>[];
    for (int i = 0; i < indexCheckItem; i++) {
      listItem.add(Item(true, _listItemController[i].text.trim()));
    }
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("quick_note")
        .add({
      'title': titleController.text.trim(),
      'color': _chosenColor,
      'time': DateTime.now(),
      'type': 'Check List',
      'length': indexCheckItem,
      'listItem': FieldValue.arrayUnion([
        for (int i = 0; i < indexCheckItem; i++)
          {'checked': listItem[i].checked, 'text': listItem[i].text}
      ]),
    });
    Navigator.pop(context);
  }
}

class CheckItem extends StatelessWidget {
  const CheckItem({
    Key? key,
    required this.index,
    required this.controller,
  }) : super(key: key);

  final int index;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24),
      width: size.width,
      height: 20,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Color(0xFFF4F4F4),
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                color: Color(0xFF979797),
              ),
            ),
          ),
          SizedBox(width: 14),
          Container(
            width: size.width * .4,
            height: 40,
            child: TextFormField(
              controller: controller,
              // validator: (val) =>
              //     val!.isNotEmpty ? null : "Please enter list item",
              decoration: InputDecoration(
                hintText: "List Item ${index + 1}",
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
