import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_course/UI/Auth/Otp.dart';
import 'package:firebase_course/Utils/Utils.dart';
import 'package:firebase_course/Widgets/SizeBox.dart';
import 'package:firebase_course/Widgets/round_Button.dart';
import 'package:flutter/material.dart';

class PhoneAuth extends StatefulWidget {
  PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  bool loading = false;
  final phonenocontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login with Phone'),
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
            controller: phonenocontroller,
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
            title: "login",
            onTap: () {
              setState(() {
                loading = true;
              });
              auth.verifyPhoneNumber(
                phoneNumber: phonenocontroller.text,
                verificationCompleted: (_) {},
                verificationFailed: (e) {
                  Utils().toastMessage(e.toString());
                },
                codeSent: (String verificationId, int? token) {
                  setState(() {
                    loading = false;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpAuth(
                          verificationId: verificationId,
                        ),
                      ));
                },
                codeAutoRetrievalTimeout: (e) {
                  setState(() {
                    loading = false;
                  });
                  Utils().toastMessage(e.toString());
                },
              );
            },
          ),
        ),
      ]),
    );
  }
}
