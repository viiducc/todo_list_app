import 'package:flutter/material.dart';
import 'package:todo_list_app/routes/navigationheader/navigation.dart';
import 'package:todo_list_app/routes/tabs/Tabs.dart';

class WorkList extends StatefulWidget {
  const WorkList();
  @override
  State<WorkList> createState() => _WorkListState();
}

class _WorkListState extends State<WorkList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          NavigationHeader(),
          Tabs(),
        ],
      ),
    );
  }
}
