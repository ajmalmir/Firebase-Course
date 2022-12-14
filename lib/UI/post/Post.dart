import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_course/UI/Auth/LoginScreen.dart';
import 'package:firebase_course/Utils/Utils.dart';
import 'package:firebase_course/Widgets/Colors_Ui.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostStreenState();
}

class _PostStreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: Text('POST'),
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut().then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                }).onError((error, stackTrace) {
                  // ! ToastMessage
                  Utils().toastMessage(error.toString());
                });
              },
              icon: Icon(
                Icons.logout,
                color: Colors.green,
              )),
        ],
      ),
      backgroundColor: white,
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
