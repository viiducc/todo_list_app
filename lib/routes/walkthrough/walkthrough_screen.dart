import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/routes/walkthrough/widget/walkthrough_widget.dart';

class WalkThrough extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const WalkThrough();

  @override
  State<WalkThrough> createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              WalkthroughWidget('Human1', 'Footer1', 'Pagination1',
                  'Welcome to aking', 'Whats going to happen tomorrow?'),
            ],
          ),
          Positioned(
            left: (size.width - 293) / 2,
            bottom: 125,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(293, 48),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                primary: const Color(0xFFFFFFFF), // background
                onPrimary: const Color(0xFF313131), // foreground
              ),
              onPressed: () {},
              child: const Text(
                'Get Started',
                style: TextStyle(
                  color: Color(0xFF313131),
                  fontFamily: 'AvenirNextRoundedPro',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Positioned(
            left: (size.width - 52) / 2,
            bottom: 71,
            child: TextButton(
              style: TextButton.styleFrom(
                minimumSize: const Size(52, 22),
                backgroundColor: Colors.transparent,
              ),
              onPressed: () {},
              child: const Text(
                'Log In',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontFamily: 'AvenirNextRoundedPro',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
