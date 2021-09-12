import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list_app/models/check_list_model.dart';
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
  int indexCheckItem = 4;

  final List<TextEditingController> _listItemController = [
    for (int i = 0; i < 10; i++) TextEditingController(),
  ];
  final List<bool> _listCheckBox = [
    for (int i = 0; i < 10; i++) false,
  ];

  @override
  Widget build(BuildContext context) {
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
                      // for (int i = 0; i < indexCheckItem; i++)
                      for (int i = 0; i < indexCheckItem; i++)
                        CheckBoxWidget(
                          index: i,
                          titleController: _listItemController[i],
                          checkController: _listCheckBox[i],
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
      listItem.add(Item(_listCheckBox[i], _listItemController[i].text.trim()));
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

class CheckBoxWidget extends StatefulWidget {
  CheckBoxWidget(
      {Key? key,
      required this.titleController,
      required this.checkController,
      required this.index})
      : super(key: key);
  final TextEditingController titleController;
  bool checkController;
  final int index;

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: TextFormField(
        controller: widget.titleController,
        decoration: InputDecoration(
          hintText: "List Item ${widget.index + 1}",
          hintStyle: const TextStyle(
            color: Colors.black,
          ),
          border: InputBorder.none,
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      value: _checked,
      onChanged: (bool? value) {
        setState(() {
          _checked = value! ? true : false;
        });
        widget.checkController = _checked;
      },
    );
  }
}
