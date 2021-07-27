import 'package:flutter/material.dart';

class Walkthrough extends StatelessWidget {
  const Walkthrough();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/walkthrough/fill1.png'),
            Container(
              margin: const EdgeInsets.all(20),
              child: const Text(
                'aking',
                style: TextStyle(
                  color: Color(0xFF010101),
                  fontFamily: 'AvenirNextRoundedPro',
                  fontWeight: FontWeight.w900,
                  fontSize: 48,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
