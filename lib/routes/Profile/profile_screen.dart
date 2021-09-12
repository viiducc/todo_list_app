import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:todo_list_app/routes/Profile/info.dart';
import 'package:todo_list_app/routes/SignIn/signin_screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String email = '';
  String fullname = '';

  @override
  Widget build(BuildContext context) {
    loadUser();
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      appBar: AppBar(
        shadowColor: const Color(0xFFFFFFFF),
        backgroundColor: const Color(0xFFFFFFFF),
        automaticallyImplyLeading: false,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color(0xFF313131),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          InfoUser(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: const EdgeInsets.only(left: 20, top: 24),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFFF96060)),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Event',
                            style: TextStyle(
                                height: 2,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            '12 Tasks',
                            style: TextStyle(
                                height: 2,
                                color: Color(0xFFFFFFFF),
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 100,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xFF6074F9),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'To do Task',
                            style: TextStyle(
                                height: 2,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            '12 Tasks',
                            style: TextStyle(
                                height: 2,
                                color: Color(0xFFFFFFFF),
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 100,
                    width: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFF8560F9)),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Quick Notes',
                            style: TextStyle(
                                height: 2,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            '12 Tasks',
                            style: TextStyle(
                                height: 2,
                                color: Color(0xFFFFFFFF),
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Statistic",
                    style: TextStyle(
                        color: Color(0xFF313131),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          CircularPercentIndicator(
                            radius: 90.0,
                            lineWidth: 2,
                            animation: true,
                            animationDuration: 1200,
                            //backgroundColor: Color(0xFFF96060),
                            percent: 0.6,
                            center: const Text(
                              '60%',
                              style: TextStyle(
                                  height: 2,
                                  color: Color(0xFF313131),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            progressColor: Color(0xFFF96060),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          const Text(
                            'Events',
                            style: TextStyle(
                                color: Color(0xFF313131),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 28,
                      ),
                      Column(
                        children: [
                          CircularPercentIndicator(
                            radius: 90.0,
                            lineWidth: 2,
                            animation: true,
                            animationDuration: 1200,
                            //backgroundColor: Color(0xFFF96060),
                            percent: 0.4,
                            center: const Text(
                              '40%',
                              style: TextStyle(
                                  height: 2,
                                  color: Color(0xFF313131),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            progressColor: Color(0xFFF6074F9),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          const Text(
                            'To do',
                            style: TextStyle(
                                color: Color(0xFF313131),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 28,
                      ),
                      Column(
                        children: [
                          CircularPercentIndicator(
                            radius: 90.0,
                            lineWidth: 2,
                            animation: true,
                            animationDuration: 1200,
                            //backgroundColor: Color(0xFFF96060),
                            percent: 0.8,
                            center: const Text(
                              '80%',
                              style: TextStyle(
                                  height: 2,
                                  color: Color(0xFF313131),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            progressColor: Color(0xFF8560F9),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          const Text(
                            'Quick Notes',
                            style: TextStyle(
                                color: Color(0xFF313131),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Future<void> logOut() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text(
            'Are you sure?',
            style: TextStyle(
                height: 2,
                color: Color(0xFF313131),
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          content: const Text(
            'You will be redirected to login ',
            style: TextStyle(height: 2, color: Color(0xFF313131), fontSize: 18),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF96060))),
              // color: Color(0xFFF96060))),
              onPressed: () async {
                //Log out user Firebase
                await FirebaseAuth.instance.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignIn()));
              },
            ),
            TextButton(
              child: const Text('No',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              onPressed: () {
                Navigator.of(context).pop(); //Dismiss the Dialog
              },
            ),
          ],
        );
      },
    );
  }

  void loadUser() {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      setState(() {
        email = currentUser.email!;
        fullname = currentUser.displayName!;
      });
    }
  }
}
