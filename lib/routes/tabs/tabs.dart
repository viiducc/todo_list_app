// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      height: 71,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFFF96060),
          onPressed: () {},
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
