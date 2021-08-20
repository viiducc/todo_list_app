// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list_app/routes/newtask/newtask_screen.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

/// This is the private State class that goes with Tabs.
class _TabsState extends State<Tabs> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFF96060),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20.0)), //this right here
                    child: SizedBox(
                      height: 214,
                      width: 268,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                            height: 1,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewTask()));
                            },
                            child: const Text(
                              "Add Task",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'AvenirNextRoundedPro',
                                fontSize: 18,
                                color: Color(0xFF313131),
                              ),
                            ),
                          ),
                          Container(
                            height: 1,
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            color: Colors.black.withOpacity(0.2),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              "Add Quick Note",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'AvenirNextRoundedPro',
                                fontSize: 18,
                                color: Color(0xFF313131),
                              ),
                            ),
                          ),
                          Container(
                            height: 1,
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            color: Colors.black.withOpacity(0.2),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              "Add Checklist",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'AvenirNextRoundedPro',
                                fontSize: 18,
                                color: Color(0xFF313131),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 1,
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          child: const Icon(
            Icons.add,
            color: Color(0xFFFFFFFF),
          ),
          elevation: 2.0,
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: BottomNavigationBar(
            backgroundColor: const Color(0xFF292E4E),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle), label: 'My Task'),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Menu',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Quick',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            unselectedItemColor: const Color(0xFF8E8E93),
            selectedItemColor: const Color(0xFFFFFFFF),
            selectedLabelStyle: const TextStyle(
                fontFamily: 'AvenirNextRoundedPro',
                fontSize: 12,
                fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(
                fontFamily: 'AvenirNextRoundedPro',
                fontSize: 12,
                fontWeight: FontWeight.bold),
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}
