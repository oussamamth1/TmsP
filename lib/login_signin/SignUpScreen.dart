import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tms/login_signin/ForgotPasswordScreen%20.dart';
import 'package:tms/login_signin/NextScreen.dart';
import 'package:tms/login_signin/signupController.dart';

class SignUpScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // // Function to sign up with email and password
  // Future<void> _signUpWithEmailAndPassword(String email, String password) async {
  //   try {
  //     await _auth.createUserWithEmailAndPassword(email: email, password: password);
  //     // Navigate to the next screen upon successful sign-up
  //     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextScreen()));
  //   } catch (e) {
  //     // Handle sign-up errors (e.g., display error message)
  //     print('Failed to sign up with email and password: $e');
  //   }
  // }
  Future<void> _signUpWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // Navigate to the next screen upon successful sign-up
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => NextScreen()));
    } catch (e) {
      // Handle sign-up errors (e.g., display error message)
      print('Failed to sign up with email and password: $e');
      // Show Snackbar with error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to sign up: $e'), // Display the error message
        ),
      );
    }
  }
RegExp get _emailRegex => RegExp(r'^\S+@\S+$');
  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    final controller = Get.put(SignupController());
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(key :controller.signupform,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TextField(
              //   onChanged: (value) => email = value,
              //   decoration: InputDecoration(hintText: 'Email'),
              // ),
              // TextField(
              //   onChanged: (value) => password = value,
              //   decoration: InputDecoration(hintText: 'Password'),
              //   obscureText: true,
              // ),
              Expanded(child: TextFormField(validator: (value) {
                
              },
                controller:controller.firstNameController ,expands: false,decoration: InputDecoration(labelText: "firstname",prefixIcon: Icon(Icons.usb)),)),
             
                Expanded(child: TextFormField(controller: controller.lastNameController,expands: false,decoration: InputDecoration(labelText:"lasstname" ,prefixIcon: Icon(Icons.usb) ),)),
               Expanded(child: TextFormField(
      //            validator: (value) {
      // if (!_emailRegex.hasMatch(value!)) {
      //   return 'Email address is not valid';
      // }},
                controller:controller.emailController ,expands: false,decoration: InputDecoration(labelText: "email",prefixIcon: Icon(Icons.usb) ),)),
           
              Expanded(child: TextFormField(controller: controller.passwordController,expands: false,decoration: InputDecoration(labelText: "password",prefixIcon: Icon(Icons.usb)),)),
           SizedBox(height: 20),
              ElevatedButton(
                onPressed: () =>controller.signup(),
                    // _signUpWithEmailAndPassword(context, email, password),
                child: Text('Sign Up'),
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
      ),
    );
  }
}
