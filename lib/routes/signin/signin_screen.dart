import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/routes/SignUp/sign_up_screen.dart';
import 'package:todo_list_app/routes/resetpassword/resetpassword_screen.dart';
import 'package:todo_list_app/routes/tabs/tabs.dart';
import 'package:todo_list_app/routes/worklist/worklist_screen.dart';
import 'package:todo_list_app/widgets/text_field_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.west, color: Colors.black),
            iconSize: 24,
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(24, 26, 24, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 62),
                const Text(
                  'Welcome back',
                  style: TextStyle(
                    color: Color(0xFF313131),
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Sign in to continue',
                  style: TextStyle(
                    color: Color(0xFF9B9B9B),
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
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                //Username Input
                TextFieldWidget(
                    label: 'Enter your username',
                    controller: emailController,
                    obscure: false),
                const SizedBox(height: 32),
                const Text(
                  'Password',
                  style: TextStyle(
                    color: Color(0xFF313131),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                //PasswordInput
                TextFieldWidget(
                    label: 'Enter your password',
                    controller: passwordController,
                    obscure: true),

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
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(24, 80, 24, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(327, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          primary: const Color(0xFFF96060), // background
                        ),
                        onPressed: () {
                          logIn();
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF485068))),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> logIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Tabs()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
