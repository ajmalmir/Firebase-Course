import 'package:firebase_course/UI/Pages/LeaderBoard.dart';
import 'package:firebase_course/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
   
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //! This widget is the root of your application.------------------------------
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FireBase Course',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      // !Home:--------------------------------------------------------------
      home: LeaderBoard(),
    );
  }
}
