import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationHeader extends StatelessWidget {
  const NavigationHeader();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: DefaultTabController(
        length: 2,
        child: AppBar(
          title: const Text(
            'Work List',
          ),
          centerTitle: true,
          actions: const [Icon(Icons.tune)],
          backgroundColor: Color(0xFFF96060),
          bottom: const TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              indicator: UnderlineTabIndicator(
                  insets: EdgeInsets.symmetric(horizontal: 46)),
              tabs: [
                Tab(
                  text: 'Today',
                ),
                Tab(
                  text: 'Month',
                )
              ]),
        ),
      ),
    );
  }
}
