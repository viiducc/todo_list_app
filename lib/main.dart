import 'package:flutter/material.dart';
import 'package:todo_list_app/routes/walkthrough/walkthrough1_screen.dart';
import 'package:todo_list_app/routes/walkthrough/walkthrough2_screen.dart';
import 'package:todo_list_app/routes/walkthrough/walkthrough_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WalkThrough2(),
    );
  }
}
