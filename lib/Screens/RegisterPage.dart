import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/services/fireStore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  void showFailedLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          title: Text(
            'Login Failed',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Container(
            height: 100,
            child: Column(
              children: [
                Text(
                  'Invalid username or password. Please try again.',
                  style: TextStyle(
                    fontSize: 16.0, // Set the font size
                  ),
                ),
                SizedBox(height: 10), // Add some spacing between the text and other widgets
                Icon(
                  Icons.warning,
                  color: Colors.yellow, // Set the color of the warning icon
                  size: 50.0, // Set the size of the warning icon
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: Colors.blue, // Set the text color to blue
                  fontWeight: FontWeight.bold, // Make the text bold
                ),
              ),
            ),
          ],
        );
      },
    );
  }



  bool _saving = false;
  var _auth = FirebaseAuth.instance;
  var email;
  var password;
  var username;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: _saving,
          color: Colors.black,
          blur: 3.5,
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: double.infinity,
                  color: Colors.white,
                  child: const Column(
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Healthy - Personal Health Guider",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF9A9A9A)),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color(0xFF16FADF),
                        //Color(0xFF16FADF),
                        Color(0x14FFFFFF),
                      ],
                    ),
                  ),
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: const Text(
                          "Already have an account",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (context) {
                          username = context;
                        },
                        decoration: InputDecoration(
                          label: Text('Username'),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (context) {
                          email = context;
                        },
                        decoration: InputDecoration(
                          label: Text('Email'),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        onChanged: (context) {
                          password = context;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          label: Text('Password'),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                        ),
                        height: 50,
                        width: double.infinity,
                        child: GestureDetector(
                            onTap: () async {
                              setState(() {
                                _saving = true;
                              });
                              if (email != null && password != null && username != null) {
                                var res = await registerUser(
                                    name: username,
                                    email: email,
                                    password: password);
                                if (res.code == 200) {
                                  Navigator.pushNamed(context, "/details");
                                }
                                setState(() {
                                  _saving = false;
                                });
                              } else {
                                showAboutDialog(context: context);
                                print("Fill All details");
                              }

                              // Register function should implemented
                            },
                            child: Center(
                                child: Text(
                              "Get Started",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ))),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Container(
                        child: Image.asset('images/pic5.png'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
