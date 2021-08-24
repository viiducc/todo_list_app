import 'package:flutter/material.dart';
import 'package:todo_list_app/routes/Tabs/tabs.dart';

class ViewTask extends StatefulWidget {
  const ViewTask({Key? key}) : super(key: key);

  @override
  _ViewTaskState createState() => _ViewTaskState();
}

class _ViewTaskState extends State<ViewTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF96060),
      body: Stack(
        children: [
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Tabs(),
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height * 0.94,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.close),
                      Icon(Icons.settings),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
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
                          const Icon(Icons.calendar_today),
                          const SizedBox(
                            width: 10,
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
                          const Icon(Icons.description),
                          const SizedBox(
                            width: 10,
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
                          const Icon(Icons.group),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
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
                                children: [
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
                          const Icon(Icons.tag),
                          const SizedBox(
                            width: 10,
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
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 17),
                        width: 295,
                        height: 2,
                        color: Color(0xFFE4E4E4),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
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
                        'Get Started',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontFamily: 'AvenirNextRoundedPro',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: const Size(52, 22),
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {},
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
                      Icon(Icons.expand_more)
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
