import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/routes/signin/signin_screen.dart';
import 'package:todo_list_app/routes/walkthrough/widget/walkthrough_widget.dart';

class WalkThrough extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const WalkThrough();

  @override
  State<WalkThrough> createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  int currentPage = 0;
  PageController _pageController =
      new PageController(initialPage: 0, keepPage: true);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              Container(
                height: size.height,
                child: PageView(
                  controller: _pageController,
                  children: [
                    WalkthroughWidget('Human1', 'Footer1', 'Welcome to aking',
                        'Whats going to happen tomorrow?'),
                    WalkthroughWidget('Human2', 'Footer2', 'Work happens',
                        'Get notified when work happens.'),
                    WalkthroughWidget('Human3', 'Footer3', 'Tasks and assign',
                        'Task and assign them to colleagues.'),
                  ],
                  onPageChanged: (value) => {setCurrentPage(value)},
                ),
              ),
            ],
          ),
          Positioned(
            left: 168,
            top: 501,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) => getIndicator(index)),
            ),
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
              onPressed: () {
                openSignInScreen();
              },
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

  AnimatedContainer getIndicator(int pageNo) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      height: 10,
      width: (currentPage == pageNo) ? 20 : 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: (currentPage == pageNo) ? Colors.black : Colors.grey),
    );
  }

  setCurrentPage(int value) {
    currentPage = value;
    setState(() {});
  }

  openSignInScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
  }
}
