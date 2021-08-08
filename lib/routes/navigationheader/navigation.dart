import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/routes/worklist/month_screen.dart';

class NavigationHeader extends StatelessWidget {
  const NavigationHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.west),
            onPressed: () {},
          ),
          title: const Text(
            'Work List',
          ),
          centerTitle: true,
          actions: const [
            MyPopupMenu(),
          ],
          backgroundColor: const Color(0xFFF96060),
          bottom: const TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              indicator: UnderlineTabIndicator(
                insets: EdgeInsets.symmetric(horizontal: 46),
              ),
              tabs: [
                Tab(
                  text: 'Today',
                ),
                Tab(
                  text: 'Month',
                )
              ]),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text("This is Today"),
            ),
            Month()
          ],
        ),
      ),
    );
  }
}

class MyPopupMenu extends StatelessWidget {
  const MyPopupMenu({Key? key}) : super(key: key);

  // const MyPopupMenu({
  //   Key? key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.tune),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                "Incomplete Tasks",
                style: TextStyle(
                  color: Color(0xFF313131),
                  fontFamily: 'AvenirNextRoundedPro',
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              Icon(
                Icons.check,
                color: Color(0xFF7ED321),
              )
            ],
          ),
        ),
        const PopupMenuItem(
          child: Text(
            "Completed Tasks",
            style: TextStyle(
              color: Color(0xFF313131),
              fontFamily: 'AvenirNextRoundedPro',
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
        const PopupMenuItem(
          child: Text(
            "All Tasks",
            style: TextStyle(
              color: Color(0xFF313131),
              fontFamily: 'AvenirNextRoundedPro',
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}
