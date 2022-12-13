import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_course/UI/Auth/LoginScreen.dart';
import 'package:firebase_course/UI/Auth/SignUpScreen.dart';
import 'package:firebase_course/UI/Pages/LeaderBoard.dart';
import 'package:flutter/material.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

// connect pages with icons in navbar--------------------------------------

  final pages = [
    LeaderBoard(),
    LoginScreen(),
    SignUpScreen(),
  ];

// which icon will show first while opening the app-------------------------
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
//!Icons used for NavBar--------------------------------------------------------

      Icon(
        Icons.home,
        size: 30,
      ),
      Icon(
        Icons.task,
        size: 30,
      ),

      Icon(
        Icons.child_friendly_sharp,
        size: 30,
      ),

// Icons used for NavBar--------------------------------------------------------
    ];

    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        bottomNavigationBar: Theme(
          // to change Icon color----------------------------------------------------
          data: Theme.of(context)
              .copyWith(iconTheme: IconThemeData(color: Colors.white)),
          // to change Icon color----------------------------------------------------

          child: CurvedNavigationBar(
            key: navigationKey,
            color: Colors.grey,

            buttonBackgroundColor: Colors.grey,
            backgroundColor: Colors.transparent,

            // to change Icon animation speed----------------------------------------------------
            animationCurve: Curves.easeInOut,
            // animationDuration: Duration(microseconds: 100),
            // to change Icon animation speed----------------------------------------------------

            index: index,
            items: items,
            height: 60,
            // while tab on the icon
            onTap: (index) => setState(() => this.index = index),
          ),
        ),
        body: pages[index],
      ),
    );
  }
}
