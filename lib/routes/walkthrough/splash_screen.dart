import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list_app/routes/Walkthrough/walkthrough_screen.dart';
import 'package:todo_list_app/routes/tabs/tabs.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), onFinish);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/images/splash/splash.svg',
              // color: Color(0xFF9E9E9E),
              height: 149,
              width: 149,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: const Text(
                'aking',
                style: TextStyle(
                  color: Color(0xFF010101),
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
    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Tabs()));
      print(FirebaseAuth.instance.currentUser);
    } else
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const WalkThrough()));
  }
}
