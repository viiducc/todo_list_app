import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalkThrough1 extends StatelessWidget {
  const WalkThrough1();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(35, 90, 35, 30),
                child: Image.asset('assets/images/walkthrough1/undraw.png'),
              ),
              Container(
                child: Column(
                  children: const [
                    Text(
                      'Wellcome to aking',
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
                      'Whats going to happen tomorrow?',
                      style: TextStyle(
                        color: Color(0xFF313131),
                        fontFamily: 'AvenirNextRoundedPro',
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset('assets/images/walkthrough1/Pagination.png'),
              Stack(
                children: [
                  Container(
                    width: size.width,
                    child: Image.asset(
                      'assets/images/walkthrough1/footer.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: (size.width - 293) / 2,
                    top: 97,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(293, 48),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        primary: Color(0xFFFFFFFF), // background
                        onPrimary: Color(0xFF313131), // foreground
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
                        minimumSize: Size(52, 22),
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
      ),
    );
  }
}
