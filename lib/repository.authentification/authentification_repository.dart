import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tms/OnBoardringScreen.dart';
import 'package:tms/login_signin/SignInScreen.dart';
import 'package:onboarding/onboarding.dart';

class AuthCredentialRepository extends GetxController {
  static AuthCredentialRepository get instance => Get.find();
  final deviceStorage = GetStorage();
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screendirect();
  }

  screendirect() async {
    if (kDebugMode) {
      print(
          "============================............=================================");
      print(deviceStorage.read('isFirstTime'));
    }
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => SignInScreen())
        : OnBoardingScreen();
  }
}
