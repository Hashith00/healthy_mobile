import 'package:flutter/material.dart';
import 'package:untitled/services/fireStore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final FirebaseCrud createacc = FirebaseCrud();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Response n1 = Response();
  double _height = 200;
  int _age = 0;
  double _weight = 50;

  // Getting massages from the database
  void getMassages() async {
    final employees = await _firestore.collection("Employee").get();
    for (var massage in employees.docs) {
      print(massage.data()["contact_no"]);
    }
  }

  // Getting massage using data streems
  void massageStreems() async {
    await for (var snapshot in _firestore.collection("Employee").snapshots()) {
      for (var massage in snapshot.docs) {
        print(massage.data());
      }
    }
  }

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
                        _age = int.parse(context);
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
                    onTap: () {
                      // try{
                      //   n1 = await createacc.addEmployee(name: "name", position: "position", contactno: "contactno");
                      //   print(n1.message);
                      // }catch(e){
                      //   print(e);
                      // }
                      //getMassages();
                      Navigator.pushNamed(context, "home");
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      StreamBuilder<QuerySnapshot>(
                        stream: _firestore.collection("Employee").snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) { // Use hasData instead of != null
                            final messages = snapshot.data!.docs;
                            List<Text> messagesList = []; // Use camelCase for variable names

                            for (var message in messages) {
                              final messageData = message.data() as Map<String, dynamic>; // Explicit cast
                              final messageText = messageData["position"];
                              messagesList.add(Text(messageText));
                            }

                            return Column(
                              children: messagesList,
                            );
                          } else if (snapshot.hasError) { // Handle the error case
                            return Text("Error: ${snapshot.error}");
                          } else {
                            return CircularProgressIndicator(); // Show a loading indicator
                          }
                        },
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
