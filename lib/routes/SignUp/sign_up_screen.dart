import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/routes/SignIn/signin_screen.dart';
import 'package:todo_list_app/routes/tabs/tabs.dart';
import 'package:todo_list_app/widgets/text_field_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
                  'Welcome to aking',
                  style: TextStyle(
                    color: Color(0xFF313131),
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Sign up to continue',
                  style: TextStyle(
                    color: Color(0xFF9B9B9B),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 48),
                const Text(
                  'Full name',
                  style: TextStyle(
                    color: Color(0xFF313131),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                //Email Fullname
                TextFieldWidget(
                  label: 'Enter your full name',
                  controller: fullNameController,
                  obscure: false,
                ),
                const SizedBox(height: 32),

                const Text(
                  'Email',
                  style: TextStyle(
                    color: Color(0xFF313131),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                //Email Input
                TextFieldWidget(
                  label: 'Enter your email',
                  controller: emailController,
                  obscure: false,
                ),

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
                  obscure: true,
                ),

                const SizedBox(height: 32),

                const Text(
                  'Confirm Password',
                  style: TextStyle(
                    color: Color(0xFF313131),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                //Confirm Password Input
                TextFieldWidget(
                  label: 'Enter your password',
                  controller: confirmPasswordController,
                  obscure: true,
                ),

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
                      if (passwordController.text ==
                          confirmPasswordController.text) {
                        signUp();
                      }
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
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

  Future<void> signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      if (userCredential.user != null) {
        FirebaseAuth.instance.currentUser
            ?.updateDisplayName(fullNameController.text.toString());
        FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'avatar': '',
          'email': emailController.text,
          'name': fullNameController.text,
          'uid': userCredential.user!.uid,
        });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Tabs()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
