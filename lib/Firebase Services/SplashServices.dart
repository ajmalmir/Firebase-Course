import 'dart:async';

import 'package:firebase_course/UI/Auth/LoginScreen.dart';
import 'package:flutter/material.dart';
// ! Making Class------------------------
class SplashServices {
  // ! Making Function--------------------------------
  void isLogin(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            )));
  }
}
