import 'package:flutter/material.dart';
import 'package:todo_list_app/routes/walkthrough/walkthrough1_screen.dart';

class Walkthrough extends StatelessWidget {
  const Walkthrough();
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/images/walkthrouh/fill1.png'),
        Container(
          margin: const EdgeInsets.all(20),
          child: const Text('aking',
              style: TextStyle(
                color: Color(0xFF010101),
                fontFamily: 'AvenirNextRoundedPro',
                fontWeight: FontWeight.w900,
                fontSize: 48,
              )),
        )
      ],
    )));
  }
}
