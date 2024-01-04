import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              width: double.infinity,
              color: Colors.white,
              child: const Column(
                children: [
                  Text("Sign In", style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700, color: Colors.black),),
                  SizedBox(height: 5,),
                  Text("Healthy - Personal Health Guider", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xFF9A9A9A)),),
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
                  const Text("Login to your account",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black), ),
                  SizedBox(height: 30,),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (context){
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
                  SizedBox(height: 20,),
                  TextField(
                    onChanged: (context){

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
                  SizedBox(height: 40,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    height: 50,
                    width: double.infinity,

                    child: Center(child: Text("Log In", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),)),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    child: Image.asset('images/pic4.png'),
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
