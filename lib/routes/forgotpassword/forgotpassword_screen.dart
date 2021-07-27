import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(24, 26, 24, 0),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: const Icon(Icons.west, size: 24),
                ),
                const SizedBox(height: 62),
                const Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Color(0xFF313131),
                    fontFamily: 'AvenirNextRoundedPro',
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Please enter your email below to receive \nyour password reset instructions',
                  style: TextStyle(
                    color: Color(0xFF9B9B9B),
                    fontFamily: 'AvenirNextRoundedPro',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 48),
                const Text(
                  'Username',
                  style: TextStyle(
                    color: Color(0xFF313131),
                    fontFamily: 'AvenirNextRoundedPro',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  style: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Color(0xFF313131),
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Enter your username',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFC6C6C6),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(24, 32, 24, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(327, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      primary: const Color(0xFFF96060), // background
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Send Request',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontFamily: 'AvenirNextRoundedPro',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
