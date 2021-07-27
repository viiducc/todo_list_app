import 'package:flutter/material.dart';
import 'package:todo_list_app/routes/navigationheader/navigation.dart';
import 'package:todo_list_app/routes/signin/signin_screen.dart';
import 'package:todo_list_app/routes/tabs/Tabs.dart';
import 'package:todo_list_app/routes/worklist_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WorkList(),
    );
  }
}
