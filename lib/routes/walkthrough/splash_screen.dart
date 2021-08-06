import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_list_app/routes/walkthrough/walkthrough_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), onFinish);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/splash/fill1.png'),
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

  void onFinish() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WalkThrough()));
  }
}
