import 'package:flutter/material.dart';
import 'package:todo_list_app/routes/navigationheader/navigation.dart';
import 'package:todo_list_app/routes/walkthrough/splash_screen.dart';
import 'package:todo_list_app/routes/worklist_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WorkList(),
    );
  }
}
