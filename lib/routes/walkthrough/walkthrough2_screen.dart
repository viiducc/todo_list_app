import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalkThrough2 extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const WalkThrough2();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(35, 90, 35, 30),
              child: Image.asset('assets/images/walkthrough2/Human.png'),
            ),
            Column(
              children: const [
                Text(
                  'Work happens',
                  style: TextStyle(
                    color: Color(0xFF313131),
                    fontFamily: 'AvenirNextRoundedPro',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                Text(
                  'Get notified when work happens.',
                  style: TextStyle(
                    color: Color(0xFF313131),
                    fontFamily: 'AvenirNextRoundedPro',
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Image.asset('assets/images/walkthrough2/Pagination.png'),
            Stack(
              children: [
                SizedBox(
                  width: size.width,
                  child: Image.asset(
                    'assets/images/walkthrough2/Footer.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: (size.width - 293) / 2,
                  top: 97,
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
                  top: 177,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: const Size(52, 22),
                      //primary: Colors.white,
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
          ],
        ),
      ),
    );
  }
}
