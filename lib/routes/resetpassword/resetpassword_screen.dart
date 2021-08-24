import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/routes/Successful/successfull_screen.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                IconButton(
                    icon: const Icon(Icons.west),
                    iconSize: 24,
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                const SizedBox(height: 62),
                const Text(
                  'Reset Password',
                  style: TextStyle(
                    color: Color(0xFF313131),
                    fontFamily: 'AvenirNextRoundedPro',
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Reset code was sent to your email. Please\n enter the code and create new password',
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
                  'Reset Code',
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
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Enter your number',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFC6C6C6),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(height: 38),
                const Text(
                  'New password',
                  style: TextStyle(
                    color: Color(0xFF313131),
                    fontFamily: 'AvenirNextRoundedPro',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFC6C6C6),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(height: 38),
                const Text(
                  'Confirm password',
                  style: TextStyle(
                    color: Color(0xFF313131),
                    fontFamily: 'AvenirNextRoundedPro',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your confirm password',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFC6C6C6),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(24, 68, 24, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(327, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      primary: const Color(0xFFF96060), // background
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Successful()));
                    },
                    child: const Text(
                      'Change password',
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
