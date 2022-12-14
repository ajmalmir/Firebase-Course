
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_course/UI/post/Post.dart';
import 'package:firebase_course/Utils/Utils.dart';
import 'package:firebase_course/Widgets/SizeBox.dart';
import 'package:firebase_course/Widgets/round_Button.dart';
import 'package:flutter/material.dart';

class OtpAuth extends StatefulWidget {
  String verificationId;
  OtpAuth({
    super.key,
    required this.verificationId,
  });

  @override
  State<OtpAuth> createState() => _OtpAuthState();
}

class _OtpAuthState extends State<OtpAuth> {
  bool loading = false;
  final verifyController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Verify'),
      ),
      body: Column(children: [
        adh(50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: TextFormField(
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: '7780936318'),
            controller: verifyController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter phone no';
              } else {
                return null;
              }
            },
          ),
        ),
        adh(50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          // ! Button
          child: RoundButton(
            loading: loading,
            title: "virify",
            onTap: () async {
              setState(() {
                loading = true;
              });
              final credential = PhoneAuthProvider.credential(
                  verificationId: widget.verificationId,
                  smsCode: verifyController.text.toString());

              try {
                setState(() {
                  loading = false;
                });
                await auth.signInWithCredential(credential);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostScreen(),
                    ));
              } catch (e) {
                setState(() {
                  loading = false;
                });
                Utils().toastMessage(e.toString());
              }
            },
          ),
        ),
      ]),
    );
  }
}
