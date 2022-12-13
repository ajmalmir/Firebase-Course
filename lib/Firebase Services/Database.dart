import 'package:firebase_course/UI/Auth/SignUpScreen.dart';
import 'package:firebase_course/Widgets/SizeBox.dart';
import 'package:firebase_course/Widgets/round_Button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataBasePage extends StatefulWidget {
  const DataBasePage({super.key});

  @override
  State<DataBasePage> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<DataBasePage> {
  DatabaseReference ref = FirebaseDatabase.instance.ref();
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
              'Database',
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
                onTap: () {
                  var a = emailcontroller.text.toString();
                  var z = a.split('.').toString();
                  var j = z[0];

                  ref.child('users').child(z).set({
                    "email": emailcontroller.text.toString(),
                    "name": passwordcontroller.text.toString(),
                  });
                  if (_formkey.currentState!.validate()) {}
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
              )
            ],
          ),
        )),
      ),
    );
  }
}
