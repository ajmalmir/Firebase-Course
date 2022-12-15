// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';

// class DBpage extends StatefulWidget {
//   const DBpage({super.key});

//   @override
//   State<DBpage> createState() => _leadState();
// }

// class _leadState extends State<DBpage> {
//   Future<void> _firebaseRef() async {
//     FirebaseDatabase().reference().child('sers');
//   }

//   @override
//   Widget build(BuildContext context) {
//     // email?.put(0, FirebaseAuth.instance.currentUser?.email!);
//     // name?.put(0, FirebaseAuth.instance.currentUser?.displayName!);
//     // String emaila = email?.get(0);
//     // var arr = emaila.split('.');
//     // var finalemail = arr[0];
//     return Scaffold(
//       appBar: AppBar(),
//       body: StreamBuilder(
//         stream: FirebaseDatabase.instance
//             .ref()
//             .child('users')
           
//             .onValue,
//         builder: (context, snap) {
//           if (snap.hasData &&
//               !snap.hasError &&
//               snap.data!.snapshot.value != null) {
//             Map? data = snap.data!.snapshot.value as Map?;
//             List item = [];

//             data!.forEach((index, data) => item.add({"key": index, ...data}));

//             return ListView.builder(
//               itemCount: item.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(item[index]['id']),
//                   subtitle: Text(item[index]['Email'].toString()),
//                   trailing: Text(item[index]['comment'].toString()),
//                 );
//               },
//             );
//           } else
//             return Text("No data");
//         },
//       ),
//     );
//   }
// }
