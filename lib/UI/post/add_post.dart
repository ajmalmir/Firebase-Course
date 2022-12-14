import 'package:firebase_course/Utils/Utils.dart';
import 'package:firebase_course/Widgets/SizeBox.dart';
import 'package:firebase_course/Widgets/round_Button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddPostPage extends StatefulWidget {
  AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  // !controller
  final postController = TextEditingController();
  // ! loading
  bool loading = false;
  // ! create instance------------first node
  final DatabaseReference = FirebaseDatabase.instance.ref('Users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Posts')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            adh(50),
            // !TFF
            TextFormField(
              controller: postController,
              maxLines: 5,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'what is in your mind'),
            ),
            adh(50),
            // !RB
            RoundButton(
              title: 'Add',
              loading: loading,
              // ! Real Game Started--------------------------
              onTap: () {
                setState(() {
                  loading = true;
                });
                DatabaseReference.child(
                        DateTime.now().millisecondsSinceEpoch.toString())
                    .child('Email')
                    .set({
                  'comment': postController.text.toString(),
                  'id': DateTime.now().toString(),
                  'Name': 'Sadi',
                }).then((value) {
                  Utils().toastMessage('added');
                  setState(() {
                    loading = false;
                  });
                }).onError((error, stackTrace) {
                  setState(() {
                    loading = false;
                  });
                  Utils().toastMessage(error.toString());
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
