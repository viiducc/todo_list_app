import 'package:flutter/material.dart';
import 'package:todo_list_app/data/quick_note_list.dart';
import 'package:todo_list_app/models/check_list_model.dart';
import 'package:todo_list_app/models/note_model.dart';
import 'package:todo_list_app/models/quick_note.dart';
import 'package:todo_list_app/routes/AddCheckList/addchecklist_screen.dart';

class Quick extends StatefulWidget {
  const Quick({Key? key}) : super(key: key);

  @override
  _QuickState createState() => _QuickState();
}

class _QuickState extends State<Quick> {
  List<QuickNote> items = getQuickNoteList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      appBar: AppBar(
        shadowColor: Color(0xFFFFFFFF),
        backgroundColor: Color(0xFFFFFFFF),
        automaticallyImplyLeading: false,
        title: const Text(
          'Quick Notes',
          style: TextStyle(
            color: Color(0xFF313131),
            fontFamily: 'AvenirNextRoundedPro',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: getQuickNoteData,
        child: Container(
          margin: EdgeInsets.only(left: 32, right: 19, top: 43),
          //padding: EdgeInsets.only(left: 32, right: 19),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = items[index];
              if (item is Note) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 94,
                      width: 343,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFE0E0E0), spreadRadius: 2,
                            blurRadius: 9,
                            offset: Offset(5, 5), // Shadow position
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 32),
                            width: 121,
                            height: 3,
                            color: Color(item.color),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 32, right: 19),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3)),
                            padding: EdgeInsets.symmetric(vertical: 21),
                            child: Text(
                              item.description,
                              style: const TextStyle(
                                color: Color(0xFF313131),
                                fontFamily: 'AvenirNextRoundedPro',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    )
                  ],
                );
              } else if (item is CheckList) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 94,
                      width: 343,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFE0E0E0), spreadRadius: 2,
                            blurRadius: 9,
                            offset: Offset(5, 5), // Shadow position
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 32),
                            width: 121,
                            height: 3,
                            color: Color(item.color),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 32, right: 19),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3)),
                            padding: EdgeInsets.symmetric(vertical: 21),
                            child: Text(
                              item.title,
                              style: const TextStyle(
                                color: Color(0xFF313131),
                                fontFamily: 'AvenirNextRoundedPro',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          // for (int i = 0; i < item.length; i++)
                          //   CheckBoxWidget(
                          //     index: i,
                          //     titleController: item.item,
                          //     checkController: _listCheckBox[i],
                          //   ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    )
                  ],
                );
              } else {
                return Container(
                  height: 10,
                  color: Colors.red,
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> getQuickNoteData() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      items = getQuickNoteList();
    });
  }
}
