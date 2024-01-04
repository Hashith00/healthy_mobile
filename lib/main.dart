
import 'package:flutter/material.dart';
import 'Screens/startPage1.dart';
import 'Screens/startPage2.dart';
import 'Screens/startPage3.dart';
import 'Screens/LoginPage.dart';
import 'Screens/RegisterPage.dart';
import 'Screens/DetailsPage.dart';
import 'Screens/HomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/start1",
    routes: {
      "/start1" : (context) => StartingPageOne(),
      "/start2" : (context) => StartingPageTwo(),
      "/start3" : (context) => StartingPagethree(),
      "/login" : (context) => LoginScreen(),
      "/register" : (context) => RegisterPage(),
      "/details" : (context) => DetailsPage(),
      "home" : (context) => Home()
    },

  ));
}



