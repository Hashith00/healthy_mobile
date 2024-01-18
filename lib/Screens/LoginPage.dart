import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:untitled/Screens/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  @override
  void dispose() {
    super.dispose();
  }

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
                SizedBox(
                    height:
                        10), // Add some spacing between the text and other widgets
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
                setState(() {
                  _saving = false;
                });
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
  FirebaseAuth _auth = FirebaseAuth.instance;
  var email;
  var password;
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
                      "Sign In",
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
                margin: EdgeInsets.only(top: 40),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Column(
                  children: [
                    GestureDetector(
                        child: Text(
                      "Dont' have an account - Create account",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    onTap: (){
                          Navigator.pushNamed(context, '/register');
                    },),
                    SizedBox(
                      height: 30,
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
                    GestureDetector(
                        onTap: () async {
                          setState(() {
                            _saving = true;
                          });
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                            if (user != null) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                              //Navigator.pushNamed(context, '/home');
                              setState(() {
                                _saving = false;
                              });
                              print(user);
                            }
                          } catch (e) {
                            setState(() {
                              _saving = false;
                            });
                            showFailedLoginDialog(context);

                            print('Failed with error code: ${e}');
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          height: 50,
                          width: double.infinity,
                          child: Center(
                              child: Text(
                            "Log In",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Image.asset('images/pic4.png'),
                    ),
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}

// Function to show the Snackbar
