import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tms/login_signin/ForgotPasswordScreen%20.dart';
import 'package:tms/login_signin/NextScreen.dart';
import 'package:tms/login_signin/SignUpScreen.dart';

class SignInScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to sign in with email and password
  Future<void> _signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.to(NextScreen());
      // Navigate to the next screen upon successful sign-in
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextScreen()));
    } catch (e) {
      // Handle sign-in errors (e.g., display error message)
      print('Failed to sign in with email and password: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';

    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) => email = value,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            TextField(
              onChanged: (value) => password = value,
              decoration: InputDecoration(hintText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  _signInWithEmailAndPassword(context, email, password),
              child: Text('Sign In'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: const Text('Don\'t have an account? Sign up'),
            ),
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [SizedBox(width: 60,),
                     ElevatedButton(
                                     onPressed: () =>Get.to(ForgotPasswordScreen()),
                        // _signUpWithEmailAndPassword(context, email, password),
                                     child: Text('forget password Up'),
                                   ),
                   ],
                 ),
          ],
        ),
      ),
    );
  }
}
