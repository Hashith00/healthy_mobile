import 'package:flutter/material.dart';
import 'package:untitled/services/fireStore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  get uid => _auth!.currentUser!.uid;


  double _height = 200;
  int age = 0;
  double _weight = 50;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: double.infinity,
                    alignment: Alignment.topLeft,
                    child: FloatingActionButton.small(
                      onPressed: () {},
                      backgroundColor: Colors.black,
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: const Text(
                      "Give us some basic information",
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (context) {
                        age = int.parse(context);
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
                    height: 250,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          height: 200,
                          color: Colors.grey.shade200,
                          child: Image.asset('images/pic1.png'),
                          margin: EdgeInsets.all(10),
                        )),
                        Expanded(
                            child: Container(
                          height: 200,
                          color: Colors.grey.shade200,
                          child: Image.asset('images/pic2.png'),
                          margin: EdgeInsets.all(10),
                        )),
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
                        print(uid);
                        var res = await addHealthRecords(age: age, height: _height, weight: _weight, docId: uid);
                        print(res);
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
    );
  }
}
