import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
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
            fontFamily: 'AvenirNextRoundedPro',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            padding: const EdgeInsets.fromLTRB(23, 10, 10, 29),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFE0E0E0), spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(5, 5), // Shadow position
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [Icon(Icons.settings)],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: Row(
                    children: [
                      // const CircleAvatar(
                      //     backgroundColor: Colors.black, child: Text('VĐ')),
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
                                fontSize: 18),
                          ),
                          Text(
                            'hungnm@devera.vn',
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 23, top: 30),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '120',
                            style: TextStyle(
                                height: 2,
                                fontFamily: 'AvenirNextRoundedPro',
                                color: Color(0xFF313131),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            'Create Tasks',
                            style: TextStyle(
                                height: 2,
                                fontFamily: 'AvenirNextRoundedPro',
                                color: Color(0xFF9A9A9A),
                                fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 53,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '80',
                            style: TextStyle(
                                height: 2,
                                fontFamily: 'AvenirNextRoundedPro',
                                color: Color(0xFF313131),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            'Completed Tasks',
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
                )
              ],
            ),
          ),
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
                                fontFamily: 'AvenirNextRoundedPro',
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            '12 Tasks',
                            style: TextStyle(
                                height: 2,
                                fontFamily: 'AvenirNextRoundedPro',
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
                                fontFamily: 'AvenirNextRoundedPro',
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            '12 Tasks',
                            style: TextStyle(
                                height: 2,
                                fontFamily: 'AvenirNextRoundedPro',
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
                                fontFamily: 'AvenirNextRoundedPro',
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            '12 Tasks',
                            style: TextStyle(
                                height: 2,
                                fontFamily: 'AvenirNextRoundedPro',
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
                        fontFamily: 'AvenirNextRoundedPro',
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
                                  fontFamily: 'AvenirNextRoundedPro',
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
                                fontFamily: 'AvenirNextRoundedPro',
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
                                  fontFamily: 'AvenirNextRoundedPro',
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
                                fontFamily: 'AvenirNextRoundedPro',
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
                                  fontFamily: 'AvenirNextRoundedPro',
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
              ))
        ],
      ),
    );
  }
}
