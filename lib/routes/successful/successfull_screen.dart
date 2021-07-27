import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Successful extends StatelessWidget {
  const Successful();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 170,
                ),
                Image.asset('assets/images/successful/Successful.png'),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Succesful!',
                  style: TextStyle(
                    color: Color(0xFF313131),
                    fontFamily: 'AvenirNextRoundedPro',
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'You have succesfully change password.\n Please use your new passwords when',
                  style: TextStyle(
                    color: Color(0xFF313131),
                    fontFamily: 'AvenirNextRoundedPro',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
                const Text(
                  'logging in.',
                  style: TextStyle(
                    color: Color(0xFF313131),
                    fontFamily: 'AvenirNextRoundedPro',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
