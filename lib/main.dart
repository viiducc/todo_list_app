import 'package:flutter/material.dart';
import 'package:todo_list_app/routes/walkthrough/walkthrough_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Walkthrough(),
    );
  }
}
