import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_course/UI/Auth/LoginScreen.dart';
import 'package:firebase_course/UI/post/add_post.dart';
import 'package:firebase_course/Utils/Utils.dart';
import 'package:firebase_course/Widgets/Colors_Ui.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostStreenState();
}

class _PostStreenState extends State<PostScreen> {
  // ! create a instance
  final ref = FirebaseDatabase.instance.ref('Users');
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    return Scaffold(
      // !FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPostPage(),
              ));
        },
        child: Icon(Icons.add),
      ),
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
          children: [
            // ! Streambuilder
            Expanded(
              child: StreamBuilder(
                stream: ref.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  return ListView.builder(
                    itemCount: snapshot.data?.snapshot.children.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Hellow'),
                      );
                    },
                  );
                },
              ),
            ),
            Expanded(
              child: FirebaseAnimatedList(
                defaultChild: Text('Loading.....'),
                query: ref,
                itemBuilder: (context, snapshot, animation, index) {
                  return ListTile(
                    title: Text(snapshot
                        .child('Email')
                        .child('comment')
                        .value
                        .toString()),
                    subtitle: Text(
                        snapshot.child('Email').child('id').value.toString()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
