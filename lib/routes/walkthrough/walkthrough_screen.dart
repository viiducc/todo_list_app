import 'package:flutter/material.dart';

class Walkthrough extends StatelessWidget {
  const Walkthrough();
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/images/fill1.png'),
        Container(
          margin: EdgeInsets.all(20),
          child: Text('aking',
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
