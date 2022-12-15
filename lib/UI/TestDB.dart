import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DBTestScreen extends StatefulWidget {
  const DBTestScreen({super.key});

  @override
  State<DBTestScreen> createState() => _DBTestScreenState();
}

class _DBTestScreenState extends State<DBTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: FirebaseDatabase.instance
            .ref()
            .child('users')
            .child('ajmalhmir')
            .onValue,
        builder: (context, snap) {
          if (snap.hasData &&
              !snap.hasError &&
              snap.data!.snapshot.value != null) {
            Map? data = snap.data!.snapshot.value as Map?;
            List item = [];

            data!.forEach((index, data) => item.add({"key": index, ...data}));

            return ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(item[index]['email'].toString().trim()),
                );
              },
            );
          } else
            return Text("No data");
        },
      ),
    );
  }
}
