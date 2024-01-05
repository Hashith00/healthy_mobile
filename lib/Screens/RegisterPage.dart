import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/services/fireStore.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var _auth = FirebaseAuth.instance;
  var email;
  var password;
  var username;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
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
                  const Text(
                    "Create your account",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
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
                      onTap: ()async {
                        if(email != null && password != null){
                          var res = await registerUser(name: username, email: email, password: password);
                         if(res.code == 200){
                           Navigator.pushNamed(context, "/details");
                         }
                        }else{
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
        )),
      ),
    );
  }
}
