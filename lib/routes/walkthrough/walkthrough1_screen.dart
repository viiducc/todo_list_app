import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalkThrough1 extends StatelessWidget {
  const WalkThrough1();
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/images/walkthrough1/undraw.png'),
          const Text('Wellcome to aking'),
          const SizedBox(height: 20),
          const Text('Whats going to happen tomorrow?'),
          Image.asset('assets/images/walkthrough1/footer.png')
        ],
      ),
    )));
  }
}
