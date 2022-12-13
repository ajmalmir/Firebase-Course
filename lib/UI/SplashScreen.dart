import 'package:firebase_course/Firebase%20Services/SplashServices.dart';
import 'package:firebase_course/Widgets/SizeBox.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
   SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // ! Initilizing SplashServices-----------------------------
  SplashServices splashScreen = SplashServices();
  // ! Making InitState Function-----------------------------
  @override
  void initState() {
    super.initState();
    splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite,
            size: 100,
          ),
          adh(20),
          Text(
            'F I R E B A S E',
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      )),
    );
  }
}
