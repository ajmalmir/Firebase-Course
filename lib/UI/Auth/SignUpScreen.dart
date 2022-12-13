import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_course/UI/Auth/LoginScreen.dart';
import 'package:firebase_course/Utils/Utils.dart';
import 'package:firebase_course/Widgets/SizeBox.dart';
import 'package:firebase_course/Widgets/round_Button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  void SignUp() {
    setState(() {
      loading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
            email: emailcontroller.text.toString(),
            password: passwordcontroller.text.toString())
        .then((value) {
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  // initialy false------------------
  bool loading = false;
  // ! Adding Velidator---------------------------
  final _formkey = GlobalKey<FormState>();
  //! Controllers-------------------------------------
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  // final namecontroller = TextEditingController();
// ! Initilizing with api ----------------------------
  FirebaseAuth _auth = FirebaseAuth.instance;

  // ! Calling Dispose Function------------------------
  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // !AppBar-----------------------------------------
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'SignUp',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      // ! Body------------------------------------------
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  // ! Email---------------------------------
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      // ! using Validator-----
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'Enter Email ';
                        } else {
                          return null;
                        }
                      }),
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                        ),
                        hintText: 'Enter Email',
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      )),
                  adh(20),
                  // ! Password---------------------------------
                  TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      // ! using Validator-----
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'Enter Email ';
                        } else {
                          return null;
                        }
                      }),
                      obscureText: true,
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.black,
                        ),
                        hintText: 'Enter Password',
                        labelText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      )),
                ],
              ),
            ),
            adh(50),
            // ! Button--------------------------------
            RoundButton(
              title: 'Submit',
              loading: loading,
              onTap: () {
                if (_formkey.currentState!.validate()) {
                  SignUp();
                }
              },
            ),
            adh(20),
            // ! TextButton----------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have and Account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
