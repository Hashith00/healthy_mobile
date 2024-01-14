
import 'package:flutter/material.dart';
import 'Screens/startPage1.dart';
import 'Screens/startPage2.dart';
import 'Screens/startPage3.dart';
import 'Screens/LoginPage.dart';
import 'Screens/RegisterPage.dart';
import 'Screens/DetailsPage.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/GetHealthRecordScreen.dart';
import 'Screens/PressureDetails.dart';
import 'Screens/CholesterolDetails.dart';
import 'Screens/SugarDetails.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screens/HeartRateDetails.dart';

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
      "/gethealthrecord" : (context) => GethealthRecord(),
      '/heart' :(context) => HeartrateDetails(),
      "/pressure" : (context) => PressureDeatils(),
      "/cholesterol" : (context) =>CholesterolDeatils(),
      '/sugar' : (context) => SugarDeatils(),
      "/home" : (context) => Home()
    },

  ));
}



