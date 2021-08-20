import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list_app/routes/tabs/tabs.dart';

class AddCheckList extends StatefulWidget {
  const AddCheckList({Key? key}) : super(key: key);

  @override
  _AddCheckListState createState() => _AddCheckListState();
}

class _AddCheckListState extends State<AddCheckList> {
  bool checked = false;
  List<int> selectedList = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.west),
        title: Text('Add Check List'),
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
            Positioned(left: 0, right: 0, bottom: 0, child: Tabs()),
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
                          maxLines: 2,
                          decoration: const InputDecoration(
                            hintText:
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
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
                      Container(
                        margin: EdgeInsets.only(bottom: 40),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CheckboxListTile(
                              title: const Text(
                                "List Item 1",
                                style: TextStyle(
                                  color: Color(0xFF313131),
                                  fontFamily: 'AvenirNextRoundedPro',
                                  fontSize: 16,
                                ),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (value) {
                                setState(() {
                                  if (value == true) {
                                    selectedList.add(1);
                                  } else {
                                    selectedList.remove(1);
                                  }
                                });
                              },
                              value: selectedList.contains(1),
                            ),
                            CheckboxListTile(
                              title: const Text(
                                "List Item 2",
                                style: TextStyle(
                                  color: Color(0xFF313131),
                                  fontFamily: 'AvenirNextRoundedPro',
                                  fontSize: 16,
                                ),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (value) {
                                setState(() {
                                  if (value == true) {
                                    selectedList.add(2);
                                  } else {
                                    selectedList.remove(2);
                                  }
                                });
                              },
                              value: selectedList.contains(2),
                            ),
                            CheckboxListTile(
                              title: const Text(
                                "List Item 3",
                                style: TextStyle(
                                  color: Color(0xFF313131),
                                  fontFamily: 'AvenirNextRoundedPro',
                                  fontSize: 16,
                                ),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (value) {
                                setState(() {
                                  if (value == true) {
                                    selectedList.add(3);
                                  } else {
                                    selectedList.remove(3);
                                  }
                                });
                              },
                              value: selectedList.contains(3),
                            ),
                            CheckboxListTile(
                              title: const Text(
                                "List Item 4",
                                style: TextStyle(
                                  color: Color(0xFF313131),
                                  fontFamily: 'AvenirNextRoundedPro',
                                  fontSize: 16,
                                ),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (value) {
                                setState(() {
                                  if (value == true) {
                                    selectedList.add(4);
                                  } else {
                                    selectedList.remove(4);
                                  }
                                });
                              },
                              value: selectedList.contains(4),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                '+ Add new item',
                                style: TextStyle(
                                    color: Color(0xFF313131),
                                    fontFamily: 'AvenirNextRoundedPro',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                  color: Color(0xFF6074F9),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                  color: Color(0xFFE42B6A),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                  color: Color(0xFF5ABB56),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                  color: Color(0xFF3D3A62),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                  color: Color(0xFFF4CA8F),
                                  borderRadius: BorderRadius.circular(5)),
                            )
                          ],
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
                          onPressed: () {},
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
}
