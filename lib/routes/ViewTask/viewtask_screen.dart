import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewTask extends StatefulWidget {
  const ViewTask({Key? key}) : super(key: key);

  @override
  _ViewTaskState createState() => _ViewTaskState();
}

class _ViewTaskState extends State<ViewTask> {
  bool comment = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      //Tabs(),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.settings),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ), //this right here
                                  child: Container(
                                    height: 150,
                                    width: 200,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 1,
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: const Text(
                                              "Add to Project",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily:
                                                    'AvenirNextRoundedPro',
                                                fontSize: 18,
                                                color: Color(0xFF313131),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: const Text(
                                              "Add Member",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily:
                                                    'AvenirNextRoundedPro',
                                                fontSize: 18,
                                                color: Color(0xFF313131),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: const Text(
                                              "Delete Task",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily:
                                                    'AvenirNextRoundedPro',
                                                fontSize: 18,
                                                color: Color(0xFF313131),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 1,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                                ;
                              });
                        },
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text(
                      'Meeting according with design\nteam in Central Park',
                      style: TextStyle(
                          height: 2,
                          fontFamily: 'AvenirNextRoundedPro',
                          color: Color(0xFF313131),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                              backgroundColor: Colors.black, child: Text('VĐ')),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Assigned to',
                                style: TextStyle(
                                    height: 2,
                                    fontFamily: 'AvenirNextRoundedPro',
                                    color: Color(0xFF9A9A9A),
                                    fontSize: 16),
                              ),
                              Text(
                                'Stephen Chow',
                                style: TextStyle(
                                    height: 2,
                                    fontFamily: 'AvenirNextRoundedPro',
                                    color: Color(0xFF313131),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 17),
                        width: 295,
                        height: 2,
                        color: const Color(0xFFE4E4E4),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(
                            'assets/icons/taskview/calendar.svg',
                            // color: Color(0xFF9E9E9E),
                            color: Color(0xFF9E9E9E),
                            height: 18,
                            width: 18,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Due Date',
                                style: TextStyle(
                                    height: 2,
                                    fontFamily: 'AvenirNextRoundedPro',
                                    color: Color(0xFF9A9A9A),
                                    fontSize: 16),
                              ),
                              Text(
                                'Aug 5,2018',
                                style: TextStyle(
                                    height: 2,
                                    fontFamily: 'AvenirNextRoundedPro',
                                    color: Color(0xFF313131),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 17),
                        width: 295,
                        height: 2,
                        color: Color(0xFFE4E4E4),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(
                            'assets/icons/taskview/description.svg',
                            // color: Color(0xFF9E9E9E),
                            color: Color(0xFF9E9E9E),
                            height: 18,
                            width: 18,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Decription',
                                style: TextStyle(
                                    height: 2,
                                    fontFamily: 'AvenirNextRoundedPro',
                                    color: Color(0xFF9A9A9A),
                                    fontSize: 16),
                              ),
                              Text(
                                'Lorem ipsum dolor sit amet,\nconsectetur adipiscing. ',
                                style: TextStyle(
                                    height: 2,
                                    fontFamily: 'AvenirNextRoundedPro',
                                    color: Color(0xFF313131),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 17),
                        width: 295,
                        height: 2,
                        color: Color(0xFFE4E4E4),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(
                            'assets/icons/taskview/members.svg',
                            // color: Color(0xFF9E9E9E),
                            color: Color(0xFF9E9E9E),
                            height: 18,
                            width: 18,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Members',
                                style: TextStyle(
                                    height: 2,
                                    fontFamily: 'AvenirNextRoundedPro',
                                    color: Color(0xFF9A9A9A),
                                    fontSize: 16),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  CircleAvatar(
                                      backgroundColor: Colors.black,
                                      child: Text('VĐ')),
                                  CircleAvatar(
                                      backgroundColor: Colors.black,
                                      child: Text('VĐ')),
                                  CircleAvatar(
                                      backgroundColor: Colors.black,
                                      child: Text('VĐ')),
                                  CircleAvatar(
                                      backgroundColor: Colors.black,
                                      child: Text('VĐ')),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 17),
                        width: 295,
                        height: 2,
                        color: Color(0xFFE4E4E4),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(
                            'assets/icons/taskview/tag.svg',
                            // color: Color(0xFF9E9E9E),
                            color: const Color(0xFF9E9E9E),
                            height: 18,
                            width: 18,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Tag',
                                style: TextStyle(
                                    height: 2,
                                    fontFamily: 'AvenirNextRoundedPro',
                                    color: Color(0xFF9A9A9A),
                                    fontSize: 16),
                              ),
                              Text(
                                'Aug 5,2018',
                                style: TextStyle(
                                    height: 2,
                                    fontFamily: 'AvenirNextRoundedPro',
                                    color: Color(0xFF313131),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  commentWidget(),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(293, 48),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        primary: const Color(0xFF6074F9), // background
                        //onPrimary: const Color(0xFFFFFFFF), // foreground
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Complete Task',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontFamily: 'AvenirNextRoundedPro',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  comment == false
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                minimumSize: const Size(52, 22),
                                backgroundColor: Colors.transparent,
                              ),
                              onPressed: () {
                                setState(() {
                                  comment = true;
                                });
                              },
                              child: const Text(
                                'Comment',
                                style: TextStyle(
                                  color: Color(0xFF313131),
                                  fontFamily: 'AvenirNextRoundedPro',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/icons/taskview/comment.svg',
                              // color: Color(0xFF9E9E9E),
                              height: 18,
                              width: 18,
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  commentWidget() {
    return (comment == true
        ? Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 33),
                //padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color(0xFFEAEAEA),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      // height: 75,
                      child: TextFormField(
                        maxLines: 3,
                        cursorColor: Color(0xFFEAEAEA),
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 18),
                            hintText: 'Write a comment'),
                      ),
                    ),
                    Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: const Color(0xFFF8F8F8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/taskview/image.svg',
                            // color: Color(0xFF9E9E9E),
                            color: const Color(0xFF9E9E9E),
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(
                            width: 21,
                          ),
                          SvgPicture.asset(
                            'assets/icons/taskview/attach.svg',
                            // color: Color(0xFF9E9E9E),
                            color: const Color(0xFF9E9E9E),
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(
                            width: 180,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Send',
                              style: TextStyle(
                                  color: Color(0xFF6074F9),
                                  fontFamily: 'AvenirNextRoundedPro',
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/profile/StephenChow.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Stephen Chow',
                            style: TextStyle(
                                height: 2,
                                fontFamily: 'AvenirNextRoundedPro',
                                color: Color(0xFF313131),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            '3 days ago',
                            style: TextStyle(
                                height: 2,
                                fontFamily: 'AvenirNextRoundedPro',
                                color: Color(0xFF9A9A9A),
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 9, bottom: 24),
                    child: const Text(
                      'Lorem ipsum dolor sit amet,consectetur adipiscing. ',
                      style: TextStyle(
                          fontFamily: 'AvenirNextRoundedPro',
                          color: Color(0xFF313131),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/profile/StephenChow.png',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Stephen Chow',
                            style: TextStyle(
                                height: 2,
                                fontFamily: 'AvenirNextRoundedPro',
                                color: Color(0xFF313131),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            '3 days ago',
                            style: TextStyle(
                                height: 2,
                                fontFamily: 'AvenirNextRoundedPro',
                                color: Color(0xFF9A9A9A),
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 9, bottom: 24),
                    child: Image.asset(
                      'assets/images/taskview/workingman.png',
                      fit: BoxFit.fitWidth,
                    ),
                  )
                ],
              ),
            ],
          )
        : const SizedBox(
            height: 32,
          ));
  }
}
