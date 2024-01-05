import 'package:flutter/material.dart';

class GethealthRecord extends StatefulWidget {
  const GethealthRecord({super.key});

  @override
  State<GethealthRecord> createState() => _GethealthRecordState();
}

class _GethealthRecordState extends State<GethealthRecord> {
  var BloodPressure;
  var BloodSugar;
  var CholesterolLevel;
  var HeartRate;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 10),
            width: double.infinity,
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      child: const Text(
                        "Health Records",
                        style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.fromLTRB(15, 0, 15,10),
                      child: Text("Blood Pressure", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 30),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (context) {
                          BloodPressure = context;
                        },
                        decoration: InputDecoration(
                          label: Text('Blood Pressure'),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.fromLTRB(15, 0, 15,10),
                      child: Text("Blood Sugar", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 30),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (context) {
                          BloodSugar = context;
                        },
                        decoration: InputDecoration(
                          label: Text('Blood Sugar'),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.fromLTRB(15, 0, 15,10),
                      child: Text("Cholesterol Level", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 30),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (context) {
                          CholesterolLevel = context;
                        },
                        decoration: InputDecoration(
                          label: Text('Cholesterol Level'),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.fromLTRB(15, 0, 15,10),
                      child: Text("Heart Rate", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (context) {
                          CholesterolLevel = context;
                        },
                        decoration: InputDecoration(
                          label: Text('Heart Rate'),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Text("Proceed", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),),
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

