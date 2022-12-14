import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_course/UI/Auth/Phone_Auth.dart';
import 'package:firebase_course/UI/Auth/SignUpScreen.dart';
import 'package:firebase_course/UI/post/Post.dart';
import 'package:firebase_course/Utils/Utils.dart';
import 'package:firebase_course/Widgets/Colors_Ui.dart';
import 'package:firebase_course/Widgets/SizeBox.dart';
import 'package:firebase_course/Widgets/round_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool loading = false;
  final _auth = FirebaseAuth.instance;
  // ! Adding Velidator---------------------------
  final _formkey = GlobalKey<FormState>();
  //! Controllers-------------------------------------
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  // ! Calling Dispose Function------------------------
  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailcontroller.text.toString().trim(),
            password: passwordcontroller.text.toString().trim())
        .then((value) {
      setState(() {
        loading = false;
      });
      Utils().toastMessage(value.user!.email.toString());
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostScreen(),
          ));
    }).onError((error, stackTrace) {
      setState(() {
        loading = false;
      });
      Utils().toastMessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        // !AppBar-----------------------------------------
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              'Login',
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
                title: 'Login',
                loading: loading,
                onTap: () {
                  if (_formkey.currentState!.validate()) {
                    login();
                  }
                },
              ),
              adh(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("dont't have and Account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ));
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              // !Login with Mobile Phone
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhoneAuth(),
                      ));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(child: Text('Login with Phone ')),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
