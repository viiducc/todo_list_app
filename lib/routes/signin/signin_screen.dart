import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/routes/resetpassword/resetpassword_screen.dart';
import 'package:todo_list_app/routes/worklist_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(24, 26, 24, 0),
          child: SingleChildScrollView(
            child: Column(
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
                  'Welcome back',
                  style: TextStyle(
                    color: Color(0xFF313131),
                    fontFamily: 'AvenirNextRoundedPro',
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Sign in to continue',
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

                //Username Input
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
                const SizedBox(height: 32),
                const Text(
                  'Password',
                  style: TextStyle(
                    color: Color(0xFF313131),
                    fontFamily: 'AvenirNextRoundedPro',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                //PasswordInput
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
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ResetPassword()));
                      },
                      child: const Text(
                        'Forgot password',
                        style: TextStyle(
                          color: Color(0xFF313131),
                          fontFamily: 'AvenirNextRoundedPro',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(24, 80, 24, 180),
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
                              builder: (context) => const WorkList()));
                    },
                    child: const Text(
                      'Log In',
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
