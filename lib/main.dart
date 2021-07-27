import 'package:flutter/material.dart';
import 'package:todo_list_app/routes/forgotpassword/forgotpassword_screen.dart';
import 'package:todo_list_app/routes/resetpassword/resetpassword_screen.dart';
import 'package:todo_list_app/routes/successful/successfull_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Successful(),
    );
  }
}
