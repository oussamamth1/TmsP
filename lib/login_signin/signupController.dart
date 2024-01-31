import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/Models/model/usersmodel.dart';
import 'package:tms/login_signin/NextScreen.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  SignupController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final GlobalKey<FormState> signupform = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> signup() async {
    try {
      if (signupform.currentState!.validate()) {
        await _auth.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());
        adduserdetail();
        // Navigate to the next screen upon successful sign-up
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => NextScreen()));

        Get.to(NextScreen());
        return;
      }
    } catch (e) {
      Get.rawSnackbar(
          messageText:
              Text('$e', style: TextStyle(color: Colors.white, fontSize: 14)),
          isDismissible: true,
          duration: const Duration(seconds: 2),
          backgroundColor: Color.fromARGB(255, 241, 9, 5)!,
          icon: const Icon(
            Icons.wifi_off,
            color: Colors.white,
            size: 35,
          ),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED);
    }
  }

  Future adduserdetail() async {
    UserModel user = UserModel(
      email: emailController.text.trim(),
      username: usernameController.text.trim(),
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
    );

    await FirebaseFirestore.instance.collection('users').add(user.toJson());
  }
}
