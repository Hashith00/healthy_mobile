import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:untitled/services/fireStore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'SugarDetails.dart';
import 'HeartRateDetails.dart';
import 'PressureDetails.dart';
import 'CholesterolDetails.dart';
import 'package:firebase_auth/firebase_auth.dart';



class HomeMain extends StatefulWidget {

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {


  var auth = FirebaseAuth.instance;
  var user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user =getUser(uid: auth.currentUser!.uid);



  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Health extends StatefulWidget {

  var user;


  Health({
    Key? key, // Add this line for the key parameter
    required this.user,
  }) : super(key: key); // Call the superclass constructor correctly

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  var auth = FirebaseAuth.instance;
  var user1;
  var name = '';
  var bloodPressure;
  var heartRate;
  var bloodSugar;
  var choles;

  getUserDeatils()async{
    user1 = await getUser(uid: auth.currentUser!.uid);
    setState(() {
      name = user1['name'];
      bloodPressure = user1['blood pressure'];
      heartRate = user1['heart rate'];
      bloodSugar = user1['blood sugar'];
      choles = user1['cholesterol level'];
      print(name);
      _saving = false;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _saving = true;
    });
    getUserDeatils();


  }
  var _saving = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _saving,
      color: Colors.black,
      blur: 3.5,
      child: Column(
        children: [
          Container(

            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello,",
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
                Text(
                  '$name',
                  style:
                  TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 70,
                ),
                Text(
                  "3 Days ago",
                  style:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                )
              ],
            ),
          ),
          Container(
            color: Color(0xFFededed),
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
            Expanded(
            child: Container(
                margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            height: 210,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/pblue.png"),
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomCenter
              ),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(child: Image.asset('images/pblue.png'), height: 30,width: 30,),
                    Text(
                      "  Blood Pressure",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "$bloodPressure",
                  style: TextStyle(
                      fontSize: 50, fontWeight: FontWeight.w700, color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.only(left: 80),
                    child: Text(
                      "mmHg",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => PressureDeatils(),
                    ));

                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 100),
                    child: Icon(Bootstrap.three_dots, size: 40,color: Colors.black,),
                  ),
                )
              ],
            ),
          )),
                    Expanded(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(10),
                          height: 210,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/pred.png"),
                                fit: BoxFit.contain,
                                alignment: Alignment.bottomCenter
                            ),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(child: Image.asset('images/pred.png'), height: 30,width: 30,),
                                  const Text(
                                    "  Heart Rate",
                                    style: TextStyle(fontSize: 15, color: Colors.black),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "$heartRate",
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.w700, color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  padding: EdgeInsets.only(left: 80),
                                  child: Text(
                                    "mmHg",
                                    style: TextStyle(fontSize: 15, color: Colors.black),
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HeartrateDetails(),
                                      ));

                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 100),
                                  child: Icon(Bootstrap.three_dots, size: 40,color: Colors.black,),
                                ),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(10),
                          height: 210,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/porange.png"),
                                fit: BoxFit.contain,
                                alignment: Alignment.bottomCenter
                            ),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(child: Image.asset('images/porange.png'), height: 30,width: 30,),
                                  const Text(
                                    "  Blood Sugar",
                                    style: TextStyle(fontSize: 15, color: Colors.black),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "$bloodSugar",
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.w700, color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  padding: EdgeInsets.only(left: 80),
                                  child: Text(
                                    "mmHg",
                                    style: TextStyle(fontSize: 15, color: Colors.black),
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SugarDeatils(),
                                      ));

                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 100),
                                  child: Icon(Bootstrap.three_dots, size: 40,color: Colors.black,),
                                ),
                              )
                            ],
                          ),
                        )),
                    Expanded(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(10),
                          height: 210,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/pgreen.png"),
                                fit: BoxFit.contain,
                                alignment: Alignment.bottomCenter
                            ),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(child: Image.asset('images/pgreen.png'), height: 30,width: 30,),
                                  const Text(
                                    "  Cholesterol Level",
                                    style: TextStyle(fontSize: 15, color: Colors.black),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "$choles",
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.w700, color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  padding: EdgeInsets.only(left: 80),
                                  child: Text(
                                    "mmHg",
                                    style: TextStyle(fontSize: 15, color: Colors.black),
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CholesterolDeatils(),
                                      ));

                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 100),
                                  child: Icon(Bootstrap.three_dots, size: 40,color: Colors.black,),
                                ),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
                // This is a sample of the work

              ],
            ),
          ),

        ],
      ),
    );
  }
}


