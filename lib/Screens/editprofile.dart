import 'package:flutter/material.dart';
import 'package:untitled/services/fireStore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool _saving = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  get uid => _auth!.currentUser!.uid;


  double _height = 200;
  int age = 0;
  double _weight = 50;
  var bloodpressure;
  var bloodsugar;
  var cholestarol;
  var heartreate;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ModalProgressHUD(
        inAsyncCall: _saving,
        color: Colors.black,
        blur: 3.5,
        child: Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Container(
            child: Column(
            children: [

          Container(
            margin: EdgeInsets.all(20),
            child: const Text(
              "Edit Health Records",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
            child: Column(
              children: [
                Container(alignment: Alignment.topLeft,child: Text("Age", style: TextStyle(fontSize: 17, ),),margin: EdgeInsets.only(bottom: 5),),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (context) {
                    setState(() {
                      age = int.parse(context);
                    });

                  },
                  decoration: InputDecoration(
                    label: Text('Age'),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
                child: Column(
                  children: [
                    Container(alignment: Alignment.topLeft,child: Text("Blood Pressure", style: TextStyle(fontSize: 17, ),),margin: EdgeInsets.only(bottom: 5),),

                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (context) {
                        setState(() {
                          bloodpressure = int.parse(context);
                        });

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
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
                child: Column(
                  children: [
                    Container(alignment: Alignment.topLeft,child: Text("Heart Rate", style: TextStyle(fontSize: 17, ),),margin: EdgeInsets.only(bottom: 5),),
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (context) {
                        setState(() {
                          heartreate = int.parse(context);
                        });

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
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
                child: Column(
                  children: [
                    Container(alignment: Alignment.topLeft,child: Text("Blood Sugar", style: TextStyle(fontSize: 17, ),),margin: EdgeInsets.only(bottom: 5),),
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (context) {
                        setState(() {
                          bloodsugar = int.parse(context);
                        });

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
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 30),
                child: Column(
                  children: [
                    Container(alignment: Alignment.topLeft,child: Text("Choleserol", style: TextStyle(fontSize: 17, ),),margin: EdgeInsets.only(bottom: 5),),
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (context) {
                        setState(() {
                          cholestarol = int.parse(context);
                        });

                      },
                      decoration: InputDecoration(
                        label: Text('Choleserol'),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade300,
            ),
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Height",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Slider(
                  value: _height,
                  min: 100,
                  max: 300,
                  divisions: 200,
                  label: "${_height.round().toString()} cm",
                  activeColor: Colors.black,
                  inactiveColor: Colors.grey.shade300,
                  onChanged: (double value) {
                    setState(() {
                      _height = value;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("100 cm"),
                    Text(
                      "$_height cm",
                      style: const TextStyle(
                          fontSize: 35, fontWeight: FontWeight.w700),
                    ),
                    Text("300 cm")
                  ],
                )
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade300,
            ),
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Weight",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Slider(
                  value: _weight,
                  min: 30,
                  max: 200,
                  divisions: 170,
                  label: "${_weight.round().toString()} Kg",
                  activeColor: Colors.black,
                  inactiveColor: Colors.grey.shade300,
                  onChanged: (double value) {
                    setState(() {
                      _weight = value;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("30 Kg"),
                    Text(
                      "$_weight Kg",
                      style: const TextStyle(
                          fontSize: 35, fontWeight: FontWeight.w700),
                    ),
                    const Text("200 Kg")
                  ],
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              try{
                setState(() {
                  _saving = true;
                });
                print(uid);
                print(cholestarol);

                var res = await updateHealthrecords(bloodpressure: bloodpressure, bloodsugure: bloodsugar, cholestorollevel: cholestarol, hartrate: heartreate, docId: uid, height: _height, weight: _weight);
                print(res);
                setState(() {
                  _saving = false;
                });
               // Navigator.pushNamed(context, '/gethealthrecord');
              }catch(e){
                print(e);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black),
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              width: double.infinity,
              height: 50,
              child: Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: Colors.white),
                  )),
            ),
          ),


          ],
        ),
      ),
            ),
          ),
        ),
      ),
    );
  }
}
