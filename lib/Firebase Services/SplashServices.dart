import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_course/UI/Auth/LoginScreen.dart';
import 'package:firebase_course/UI/Pages/navbar.dart';
import 'package:flutter/material.dart';

// ! Making Class------------------------
class SplashServices {
  // ! Making Function--------------------------------
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;
    if(user != null){
       Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NavigationBarPage(),
            )));

    }else

    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            )));
  }
}
