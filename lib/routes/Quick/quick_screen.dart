import 'package:flutter/material.dart';
import 'package:todo_list_app/data/note_list.dart';
import 'package:todo_list_app/models/note.dart';

class Quick extends StatefulWidget {
  const Quick({Key? key}) : super(key: key);

  @override
  _QuickState createState() => _QuickState();
}

class _QuickState extends State<Quick> {
  List<Note> items = List.of(noteList);

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
      body: Container(
        margin: EdgeInsets.only(left: 32, right: 19),
        //padding: EdgeInsets.only(left: 32, right: 19),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 94,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
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
                SizedBox(
                  height: 16,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}