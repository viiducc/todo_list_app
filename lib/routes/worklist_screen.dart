import 'package:flutter/material.dart';
import 'package:todo_list_app/routes/navigationheader/navigation.dart';
import 'package:todo_list_app/routes/tabs/Tabs.dart';
import 'package:todo_list_app/routes/worklist/month_screen.dart';

class WorkList extends StatefulWidget {
  const WorkList({Key? key}) : super(key: key);

  @override
  State<WorkList> createState() => _WorkListState();
}

class _WorkListState extends State<WorkList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          NavigationHeader(),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Tabs(),
          ),
        ],
      ),
    );
  }
}
